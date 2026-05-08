; DESCRIPTION: Display a rectangle using color red at the screen.

; host_term.asm -- Host Shell Terminal for Geometry OS (v5)
;
; Spawns bash inside a real PTY via the PTYOPEN opcode. Pipes keystrokes
; through PTYWRITE, drains PTY output through PTYREAD each frame.
;
; v5 improvements (Phase 133):
;   - SMALLTEXT opcode (3x5 font) for 85 readable columns
;   - Dynamic COLS/ROWS from WINSYS window size
;   - Horizontal scroll with Shift+Left/Right
;   - Default: 85 cols x 40 rows in 256px (3px/char, 6px/row)
;
; RAM Layout:
;   0x4000-0x4D47  Text buffer (85*40 = 3400 u32 cells, row-major)
;   0x4E00         Cursor column
;   0x4E01         Cursor row
;   0x4E02         Blink counter
;   0x4E03         PTY handle
;   0x4E04         ANSI state (0=normal, 1=saw ESC, 2=in CSI, 3=in OSC)
;   0x4E05         STATUS_CONNECTED
;   0x4E06         STATUS_CWD_LEN
;   0x4E07         OSC_LEN
;   0x4E08         WIN_ID (WINSYS window ID, 0 = disabled)
;   0x4E09         LAST_COLS (last known column count)
;   0x4E0A         H_SCROLL (horizontal scroll offset in chars)
;   0x4E0B         COLS_RAM (current column count)
;   0x4E0C         ROWS_RAM (current row count)
;   0x5000         Empty cmd string (null -> default $SHELL)
;   0x5400         Send buffer (multi-byte for arrow key sequences)
;   0x5800-0x5FFF  Receive buffer (2048 cells)
;   0x6000-0x60FF  Scratch buffer for SMALLTEXT rendering (128 chars)
;   0x6100         STATUS_CWD
;   0x6200         OSC_BUF
;   0x6300         WINFO_BUF
;
; Registers:
;   r9  CMP/result
;   r6  constant 1
;   r28 PTY handle (live copy)
;   r30 stack pointer
;
#define COLS 85
#define ROWS 40
#define BUF 0x4000
#define BUF_END 0x4D48
#define CUR_COL 0x4E00
#define CUR_ROW 0x4E01
#define BLINK 0x4E02
#define PTY_HANDLE 0x4E03
#define ANSI_STATE 0x4E04
#define STATUS_CONNECTED 0x4E05
#define STATUS_CWD 0x6100
#define STATUS_CWD_LEN 0x4E06
#define OSC_BUF 0x6200
#define OSC_LEN 0x4E07
#define CMD_BUF 0x5000
#define SEND_BUF 0x5400
#define RECV_BUF 0x5800
#define SCRATCH 0x6000
#define WIN_ID 0x4E08
#define LAST_COLS 0x4E09
#define WINFO_BUF 0x6300
#define H_SCROLL 0x4E0A
#define COLS_RAM 0x4E0B
#define ROWS_RAM 0x4E0C

; ANSI states
#define ANS_NORMAL 0
#define ANS_ESC    1
#define ANS_CSI    2
#define ANS_OSC    3

; Extended key codes (from keys.rs)
#define KEY_UP    0x80
#define KEY_DOWN  0x81
#define KEY_LEFT  0x82
#define KEY_RIGHT 0x83
#define KEY_HOME  0x84
#define KEY_END   0x85

; =========================================
; INIT
; =========================================
LDI r6, 1
LDI r30, 0xFD00

; Background fill -- dark gray
LDI r9, 0x0A0A0A
FILL r9

; Clear text buffer to spaces (85*40 = 3400 cells)
LDI r20, BUF
LDI r15, 32
LDI r11, 3400
clear_buf_init:
    STORE r20, r15
    ADD r20, r6
    CMPI r20, BUF_END
    BLT r9, clear_buf_init

; Cursor + blink + handle + ansi_state init
LDI r20, CUR_COL
LDI r9, 0
STORE r20, r9
LDI r20, CUR_ROW
STORE r20, r9
LDI r20, BLINK
STORE r20, r9
LDI r20, PTY_HANDLE
LDI r9, 0xFFFF
STORE r20, r9
LDI r20, ANSI_STATE
LDI r9, 0
STORE r20, r9
LDI r20, STATUS_CONNECTED
STORE r20, r9
LDI r20, STATUS_CWD_LEN
STORE r20, r9
LDI r20, OSC_LEN
STORE r20, r9

; Phase 133: init dynamic sizing vars
LDI r20, H_SCROLL
STORE r20, r9
LDI r20, COLS_RAM
LDI r9, COLS
STORE r20, r9
LDI r20, ROWS_RAM
LDI r9, ROWS
STORE r20, r9
LDI r9, 0

; Initialize resize tracking (WINSYS window ID = 0 = disabled)
LDI r20, WIN_ID
STORE r20, r9
LDI r20, LAST_COLS
LDI r9, COLS
STORE r20, r9
LDI r9, 0

; Title bar background (8px tall for SMALLTEXT)
LDI r6, 0
LDI r8, 0
LDI r5, 256
LDI r0, 8
LDI r2, 0x1A1A2E
RECTF r6, r8, r5, r0, r2

; Title text (using DRAWTEXT for readability in title bar)
LDI r20, SCRATCH
STRO r20, "shell"
LDI r6, 2
LDI r8, 1
LDI r5, SCRATCH
LDI r0, 0x44DD44
LDI r2, 0x1A1A2E
DRAWTEXT r6, r8, r5, r0, r2

; Close button hit region
LDI r6, 230
LDI r8, 0
LDI r5, 26
LDI r0, 8
HITSET r6, r8, r5, r0, 99

; Empty cmd string for PTYOPEN
LDI r6, CMD_BUF
LDI r9, 0
STORE r6, r9

; PTYOPEN
LDI r2, CMD_BUF
PTYOPEN r2, r4

; Save handle and mark connected
LDI r20, PTY_HANDLE
STORE r20, r4
LDI r28, 0
ADD r28, r4
LDI r20, STATUS_CONNECTED
LDI r9, 1
STORE r20, r9

; r6 = 1 (restore after earlier code clobbered it)
LDI r6, 1

; =========================================
; STARTUP DRAIN -- collect initial bash output
; =========================================
; Show "[connecting...]" in the terminal
LDI r20, SEND_BUF
STRO r20, "[connecting...]"
CALL write_str_to_buf
CALL render
FRAME

; Drain initial output for ~60 frames to collect bash prompt.
; Bash with TERM=xterm and PS1='$ ' should emit prompt bytes
; after the initial newline we sent during PTY spawn.
LDI r21, 0          ; received_any flag
LDI r22, 0          ; frame counter
LDI r23, 60         ; max startup frames

startup_drain:
    ; Read from PTY
    LDI r15, RECV_BUF
    LDI r1, 512
    PTYREAD r28, r15, r1
    MOV r10, r9
    CMPI r10, 0
    JZ r9, startup_check_done
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r9, pty_closed

    ; Process received bytes
    LDI r12, 0
startup_append:
    CMP r12, r10
    BGE r9, startup_after
    LDI r20, RECV_BUF
    ADD r20, r12
    LOAD r2, r20
    CALL process_byte
    ADD r12, r6
    JMP startup_append
startup_after:
    LDI r21, 1      ; mark as received

startup_check_done:
    CALL render
    FRAME
    ADD r22, r6
    CMPI r22, 60
    BLT r22, startup_drain

; If no output received after 60 frames, probe with echo
CMPI r21, 0
JNZ r9, startup_done

; Show "[probing...]" and send echo to trigger output
LDI r20, SEND_BUF
STRO r20, "[probing...]"
CALL write_str_to_buf
CALL render
FRAME

; Send "echo ready\n" to probe the PTY
LDI r20, SEND_BUF
LDI r9, 101
STORE r20, r9
LDI r20, SEND_BUF
ADD r20, r6
LDI r9, 99
STORE r20, r9
LDI r20, SEND_BUF
LDI r8, 2
ADD r20, r8
LDI r9, 104
STORE r20, r9
LDI r20, SEND_BUF
LDI r8, 3
ADD r20, r8
LDI r9, 111
STORE r20, r9
LDI r20, SEND_BUF
LDI r8, 4
ADD r20, r8
LDI r9, 32
STORE r20, r9
LDI r20, SEND_BUF
LDI r8, 5
ADD r20, r8
LDI r9, 114
STORE r20, r9
LDI r20, SEND_BUF
LDI r8, 6
ADD r20, r8
LDI r9, 101
STORE r20, r9
LDI r20, SEND_BUF
LDI r8, 7
ADD r20, r8
LDI r9, 97
STORE r20, r9
LDI r20, SEND_BUF
LDI r8, 8
ADD r20, r8
LDI r9, 100
STORE r20, r9
LDI r20, SEND_BUF
LDI r8, 9
ADD r20, r8
LDI r9, 121
STORE r20, r9
LDI r20, SEND_BUF
LDI r8, 10
ADD r20, r8
LDI r9, 10
STORE r20, r9

LDI r15, SEND_BUF
LDI r1, 11
PTYWRITE r28, r15, r1

; Drain probe response for 30 more frames
LDI r22, 0
probe_drain:
    LDI r15, RECV_BUF
    LDI r1, 512
    PTYREAD r28, r15, r1
    MOV r10, r9
    CMPI r10, 0
    JZ r9, probe_next
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r9, pty_closed
    LDI r12, 0
probe_append:
    CMP r12, r10
    BGE r9, probe_after
    LDI r20, RECV_BUF
    ADD r20, r12
    LOAD r2, r20
    CALL process_byte
    ADD r12, r6
    JMP probe_append
probe_after:
    LDI r21, 1
probe_next:
    CALL render
    FRAME
    ADD r22, r6
    CMPI r22, 30
    BLT r22, probe_drain

startup_done:
    LDI r6, 1

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r6, 1

    ; Check for window resize (WINSYS mode)
    CALL check_resize

    ; Drain pty into text buffer
    LDI r15, RECV_BUF
    LDI r1, 512
    PTYREAD r28, r15, r1
    ; r9 = bytes drained (0 = nothing, 0xFFFFFFFF = closed)
    ; Save byte count before CMPI destroys it
    MOV r10, r9
    CMPI r10, 0
    JZ r9, after_drain
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r9, pty_closed

    ; Process each byte through ANSI filter -> text buffer
    LDI r12, 0
append_loop:
    CMP r12, r10
    BGE r9, after_drain
    LDI r20, RECV_BUF
    ADD r20, r12
    LOAD r2, r20
    CALL process_byte
    ADD r12, r6
    JMP append_loop

pty_closed:
    ; Mark disconnected
    LDI r20, STATUS_CONNECTED
    LDI r9, 0
    STORE r20, r9
    ; Show message and stop
    LDI r20, SEND_BUF
    STRO r20, "[pty closed]"
    CALL write_str_to_buf
    JMP after_drain

after_drain:
    LDI r6, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r9, r20
    ADD r9, r6
    STORE r20, r9

    ; Render
    CALL render
    FRAME

    ; Read keystroke
    IKEY r2
    JZ r2, main_loop

    ; Translate key and send to PTY
    CALL translate_key
    ; r9 = number of bytes to send (0 = ignore, 1 = single, 3 = arrow escape)
    CMPI r9, 0
    JZ r9, main_loop

    ; Send bytes from SEND_BUF
    LDI r15, SEND_BUF
    PTYWRITE r28, r15, r9
    JMP main_loop

; =========================================
; PROCESS_BYTE -- ANSI state machine + text buffer append
; r2 = byte from PTY
; Uses ANSI_STATE at 0x4A04
; =========================================
process_byte:
    PUSH r31
    LDI r6, 1

    ; Load ANSI state
    LDI r20, ANSI_STATE
    LOAD r0, r20

    ; State: NORMAL
    CMPI r0, ANS_NORMAL
    JNZ r9, pb_check_esc

    ; Check for ESC (0x1B)
    CMPI r2, 27
    JNZ r9, pb_normal_byte

    ; Saw ESC -> transition to ESC state
    LDI r20, ANSI_STATE
    LDI r9, ANS_ESC
    STORE r20, r9
    JMP pb_ret

pb_normal_byte:
    ; Pass through to append_byte
    CALL append_byte
    JMP pb_ret

pb_check_esc:
    ; State: ESC (just saw 0x1B)
    CMPI r0, ANS_ESC
    JNZ r9, pb_check_csi

    ; Check for [ -> CSI
    CMPI r2, 91   ; '['
    JNZ r9, pb_esc_check_osc

    LDI r20, ANSI_STATE
    LDI r9, ANS_CSI
    STORE r20, r9
    JMP pb_ret

pb_esc_check_osc:
    ; Check for ] -> OSC
    CMPI r2, 93   ; ']'
    JNZ r9, pb_esc_other

    LDI r20, ANSI_STATE
    LDI r9, ANS_OSC
    STORE r20, r9
    JMP pb_ret

pb_esc_other:
    ; Any other char after ESC: not a recognized sequence.
    ; Two-char ESC sequences (ESC M, ESC 7, ESC 8) -- skip.
    LDI r20, ANSI_STATE
    LDI r9, ANS_NORMAL
    STORE r20, r9
    JMP pb_ret

pb_check_csi:
    ; State: CSI (saw ESC [)
    CMPI r0, ANS_CSI
    JNZ r9, pb_check_osc

    ; CSI sequences end with a byte in 0x40-0x7E (letter or @)
    CMPI r2, 64    ; '@' -- first terminator
    BLT r9, pb_csi_continue

    ; Byte >= 0x40 is a terminator -> sequence done
    LDI r20, ANSI_STATE
    LDI r9, ANS_NORMAL
    STORE r20, r9
    JMP pb_ret

pb_csi_continue:
    ; Still collecting CSI params
    JMP pb_ret

pb_check_osc:
    ; State: OSC (saw ESC ])
    CMPI r0, ANS_OSC
    JNZ r9, pb_reset_state

    ; OSC ends with BEL (0x07) or ST (ESC \)
    CMPI r2, 7     ; BEL
    JZ r9, pb_osc_end
    CMPI r2, 27
    JNZ r9, pb_osc_continue
    ; ESC might be start of ST
    LDI r20, ANSI_STATE
    LDI r9, ANS_ESC
    STORE r20, r9
    JMP pb_ret

pb_osc_continue:
    ; Collect OSC byte into buffer (max 80 chars)
    LDI r20, OSC_LEN
    LOAD r9, r20
    LDI r1, 80
    CMP r9, r1
    BGE r9, pb_ret
    LDI r1, OSC_BUF
    ADD r1, r9
    STORE r1, r2
    ADD r9, r6
    STORE r20, r9
    JMP pb_ret

pb_osc_end:
    ; Process collected OSC sequence
    CALL process_osc
    LDI r20, ANSI_STATE
    LDI r9, ANS_NORMAL
    STORE r20, r9
    JMP pb_ret

pb_reset_state:
    LDI r20, ANSI_STATE
    LDI r9, ANS_NORMAL
    STORE r20, r9

pb_ret:
    POP r31
    RET

; =========================================
; APPEND_BYTE -- append r2 to text buffer (visible chars only)
; \n (10) -> newline; \r (13) -> col=0; printable -> insert
; =========================================
append_byte:
    PUSH r31
    LDI r6, 1

    ; Newline
    CMPI r2, 10
    JNZ r9, ab_check_cr
    CALL do_newline
    JMP ab_ret

ab_check_cr:
    CMPI r2, 13
    JNZ r9, ab_check_print
    LDI r20, CUR_COL
    LDI r9, 0
    STORE r20, r9
    JMP ab_ret

ab_check_print:
    ; printable range 32..126 inclusive
    CMPI r2, 32
    BLT r9, ab_ret
    CMPI r2, 127
    BGE r9, ab_ret

    ; buf[row*COLS + col] = r2
    LDI r20, CUR_ROW
    LOAD r8, r20
    LDI r5, COLS
    MUL r8, r5
    LDI r20, CUR_COL
    LOAD r9, r20
    ADD r8, r9
    LDI r20, BUF
    ADD r20, r8
    STORE r20, r2

    ; col++
    LDI r20, CUR_COL
    LOAD r9, r20
    ADD r9, r6
    STORE r20, r9
    CMPI r9, COLS
    JNZ r9, ab_ret
    CALL do_newline

ab_ret:
    POP r31
    RET

; =========================================
; TRANSLATE_KEY -- translate IKEY code to PTY byte(s)
; Fills SEND_BUF with bytes, returns byte count in r9
; r2 = raw IKEY value (preserved)
; =========================================
translate_key:
    PUSH r31
    LDI r6, 1

    ; Printable ASCII (32-126): pass through as single byte
    CMPI r2, 32
    BLT r9, tk_special
    CMPI r2, 127
    BGE r9, tk_special
    LDI r20, SEND_BUF
    STORE r20, r2
    LDI r9, 1
    JMP tk_ret

tk_special:
    ; Enter (0x0D) -> \n (10)
    CMPI r2, 13
    JNZ r9, tk_bs
    LDI r20, SEND_BUF
    LDI r9, 10
    STORE r20, r9
    LDI r9, 1
    JMP tk_ret

tk_bs:
    ; Backspace (0x08) -> DEL (0x7F)
    CMPI r2, 8
    JNZ r9, tk_del
    LDI r20, SEND_BUF
    LDI r9, 127
    STORE r20, r9
    LDI r9, 1
    JMP tk_ret

tk_del:
    ; Delete (0x7F) -> ESC [ 3 ~ (just send DEL for simplicity)
    CMPI r2, 127
    JNZ r9, tk_tab
    LDI r20, SEND_BUF
    LDI r9, 127
    STORE r20, r9
    LDI r9, 1
    JMP tk_ret

tk_tab:
    CMPI r2, 9
    JNZ r9, tk_ctrl_c
    LDI r20, SEND_BUF
    LDI r9, 9
    STORE r20, r9
    LDI r9, 1
    JMP tk_ret

tk_ctrl_c:
    ; Ctrl-C: check for ASCII 3
    CMPI r2, 3
    JNZ r9, tk_ctrl_d
    LDI r20, SEND_BUF
    LDI r9, 3
    STORE r20, r9
    LDI r9, 1
    JMP tk_ret

tk_ctrl_d:
    CMPI r2, 4
    JNZ r9, tk_escape
    LDI r20, SEND_BUF
    LDI r9, 4
    STORE r20, r9
    LDI r9, 1
    JMP tk_ret

tk_escape:
    CMPI r2, 27
    JNZ r9, tk_arrow_up
    LDI r20, SEND_BUF
    LDI r9, 27
    STORE r20, r9
    LDI r9, 1
    JMP tk_ret

tk_arrow_up:
    ; Arrow Up (0x80) -> ESC [ A
    CMPI r2, KEY_UP
    JNZ r9, tk_arrow_down
    LDI r20, SEND_BUF
    LDI r9, 27
    STORE r20, r9
    LDI r20, SEND_BUF
    ADD r20, r6
    LDI r9, 91
    STORE r20, r9
    LDI r20, SEND_BUF
    LDI r8, 2
    ADD r20, r8
    LDI r9, 65
    STORE r20, r9
    LDI r9, 3
    JMP tk_ret

tk_arrow_down:
    ; Arrow Down (0x81) -> ESC [ B
    CMPI r2, KEY_DOWN
    JNZ r9, tk_arrow_right
    LDI r20, SEND_BUF
    LDI r9, 27
    STORE r20, r9
    LDI r20, SEND_BUF
    ADD r20, r6
    LDI r9, 91
    STORE r20, r9
    LDI r20, SEND_BUF
    LDI r8, 2
    ADD r20, r8
    LDI r9, 66
    STORE r20, r9
    LDI r9, 3
    JMP tk_ret

tk_arrow_right:
    ; Arrow Right (0x83) -> ESC [ C
    CMPI r2, KEY_RIGHT
    JNZ r9, tk_arrow_left
    LDI r20, SEND_BUF
    LDI r9, 27
    STORE r20, r9
    LDI r20, SEND_BUF
    ADD r20, r6
    LDI r9, 91
    STORE r20, r9
    LDI r20, SEND_BUF
    LDI r8, 2
    ADD r20, r8
    LDI r9, 67
    STORE r20, r9
    LDI r9, 3
    JMP tk_ret

tk_arrow_left:
    ; Arrow Left (0x82) -> ESC [ D
    CMPI r2, KEY_LEFT
    JNZ r9, tk_home
    LDI r20, SEND_BUF
    LDI r9, 27
    STORE r20, r9
    LDI r20, SEND_BUF
    ADD r20, r6
    LDI r9, 91
    STORE r20, r9
    LDI r20, SEND_BUF
    LDI r8, 2
    ADD r20, r8
    LDI r9, 68
    STORE r20, r9
    LDI r9, 3
    JMP tk_ret

tk_home:
    ; Home (0x84) -> ESC [ H
    CMPI r2, KEY_HOME
    JNZ r9, tk_end
    LDI r20, SEND_BUF
    LDI r9, 27
    STORE r20, r9
    LDI r20, SEND_BUF
    ADD r20, r6
    LDI r9, 91
    STORE r20, r9
    LDI r20, SEND_BUF
    LDI r8, 2
    ADD r20, r8
    LDI r9, 72
    STORE r20, r9
    LDI r9, 3
    JMP tk_ret

tk_end:
    ; End (0x85) -> ESC [ F
    CMPI r2, KEY_END
    JNZ r9, tk_ignore
    LDI r20, SEND_BUF
    LDI r9, 27
    STORE r20, r9
    LDI r20, SEND_BUF
    ADD r20, r6
    LDI r9, 91
    STORE r20, r9
    LDI r20, SEND_BUF
    LDI r8, 2
    ADD r20, r8
    LDI r9, 70
    STORE r20, r9
    LDI r9, 3
    JMP tk_ret

tk_ignore:
    ; Unknown key -- don't send anything
    LDI r9, 0

tk_ret:
    POP r31
    RET

; =========================================
; DO_NEWLINE -- col=0, row++ or scroll
; =========================================
do_newline:
    PUSH r31
    LDI r6, 1
    LDI r20, CUR_COL
    LDI r9, 0
    STORE r20, r9
    LDI r20, CUR_ROW
    LOAD r15, r20
    ADD r15, r6
    CMPI r15, ROWS
    BLT r9, dn_store
    CALL scroll_up
    LDI r20, CUR_ROW
    LDI r15, 29
dn_store:
    STORE r20, r15
    POP r31
    RET

; =========================================
; SCROLL_UP -- shift rows 1..29 up to 0..28, clear row 29
; =========================================
scroll_up:
    PUSH r31
    LDI r6, 1
    LDI r4, 0
scroll_loop:
    CMPI r4, 29
    BGE r9, scroll_clear

    LDI r20, BUF
    LDI r9, 0
    ADD r9, r4
    ADD r9, r6
    LDI r3, COLS
    MUL r9, r3
    ADD r20, r9          ; src = BUF + (row+1)*COLS

    LDI r21, BUF
    LDI r9, 0
    ADD r9, r4
    LDI r3, COLS
    MUL r9, r3
    ADD r21, r9          ; dst = BUF + row*COLS

    LDI r22, 0
scroll_copy:
    LOAD r9, r20
    STORE r21, r9
    ADD r20, r6
    ADD r21, r6
    ADD r22, r6
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r4, r6
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r15, 29
    LDI r3, COLS
    MUL r15, r3
    ADD r20, r15
    LDI r15, 32
    LDI r22, 0
sc_loop:
    STORE r20, r15
    ADD r20, r6
    ADD r22, r6
    CMPI r22, COLS
    BLT r9, sc_loop
    POP r31
    RET

; =========================================
; WRITE_STR_TO_BUF -- write null-term string at [r20] to text buffer
; =========================================
write_str_to_buf:
    PUSH r31
    PUSH r20
    LDI r6, 1
wsb_loop:
    LOAD r2, r20
    JZ r2, wsb_done
    CALL append_byte
    ADD r20, r6
    JMP wsb_loop
wsb_done:
    POP r20
    POP r31
    RET

; =========================================
; PROCESS_OSC -- handle collected OSC sequence
; Checks for OSC 7 (set cwd) and extracts path
; OSC 7 format: "7;file://host/path"
; =========================================
process_osc:
    PUSH r31
    LDI r6, 1

    ; Check if OSC starts with '7' (OSC 7 = set working directory)
    LDI r20, OSC_BUF
    LOAD r9, r20
    CMPI r9, 55    ; '7' = 55
    JNZ r9, po_done

    ; Check second byte is ';' (59)
    LDI r20, OSC_BUF
    ADD r20, r6
    LOAD r9, r20
    CMPI r9, 59    ; ';'
    JNZ r9, po_done

    ; Extract path from "7;file://HOST/PATH"
    ; Find the 3rd '/' (after file://host)
    LDI r4, 0     ; position in OSC_BUF
    LDI r3, 0     ; slash count
po_find_path:
    LDI r20, OSC_BUF
    ADD r20, r4
    LOAD r9, r20
    JZ r9, po_done  ; null terminator, no path found
    CMPI r9, 47    ; '/'
    JNZ r9, po_next
    ADD r3, r6
    ; After 3 slashes, we're at the path
    CMPI r3, 3
    BGE r9, po_copy_path
po_next:
    ADD r4, r6
    LDI r1, 80
    CMP r4, r1
    BLT r9, po_find_path
    JMP po_done

po_copy_path:
    ; r4 points to the 3rd '/' -- copy from there into STATUS_CWD
    LDI r7, 0     ; cwd offset
po_cp_loop:
    LDI r20, OSC_BUF
    ADD r20, r4
    LOAD r9, r20
    JZ r9, po_cp_done
    LDI r1, STATUS_CWD
    ADD r1, r7
    STORE r1, r9
    ADD r4, r6
    ADD r7, r6
    LDI r1, 60
    CMP r7, r1
    BLT r9, po_cp_loop
po_cp_done:
    ; Null-terminate and store length
    LDI r1, STATUS_CWD
    ADD r1, r7
    LDI r9, 0
    STORE r1, r9
    LDI r20, STATUS_CWD_LEN
    STORE r20, r7

po_done:
    ; Reset OSC buffer
    LDI r20, OSC_LEN
    LDI r9, 0
    STORE r20, r9
    POP r31
    RET

; =========================================
; DRAW_STATUS_BAR -- render title bar with shell info
; Shows: "bash: ~/path" + connected indicator on the right
; =========================================
draw_status_bar:
    PUSH r31
    LDI r6, 1

    ; Clear title bar area
    LDI r6, 0
    LDI r8, 0
    LDI r5, 256
    LDI r0, 10
    LDI r2, 0x1A1A2E
    RECTF r6, r8, r5, r0, r2

    ; Build status string in SCRATCH: "bash: " + cwd
    LDI r20, SCRATCH
    STRO r20, "bash: "
    ; Append cwd
    LDI r20, SCRATCH
    ; Find end of "bash: " (6 chars)
    LDI r4, 0
dsb_find_end:
    LDI r1, SCRATCH
    ADD r1, r4
    LOAD r9, r1
    JZ r9, dsb_append_cwd
    ADD r4, r6
    JMP dsb_find_end

dsb_append_cwd:
    ; Check if we have a cwd
    LDI r20, STATUS_CWD_LEN
    LOAD r9, r20
    JZ r9, dsb_no_cwd

    ; Append cwd chars
    LDI r3, 0
dsb_cp:
    LDI r1, STATUS_CWD
    ADD r1, r3
    LOAD r9, r1
    JZ r9, dsb_cp_done
    LDI r1, SCRATCH
    ADD r1, r4
    STORE r1, r9
    ADD r4, r6
    ADD r3, r6
    LDI r1, 38     ; max 38 chars for title
    CMP r4, r1
    BLT r9, dsb_cp
    JMP dsb_cp_done

dsb_no_cwd:
    ; No cwd known yet -- show "~"
    LDI r1, SCRATCH
    ADD r1, r4
    LDI r9, 126    ; '~'
    STORE r1, r9
    ADD r4, r6

dsb_cp_done:
    ; Null-terminate
    LDI r1, SCRATCH
    ADD r1, r4
    LDI r9, 0
    STORE r1, r9

    ; Draw the status text
    LDI r6, 2
    LDI r8, 1
    LDI r5, SCRATCH
    LDI r0, 0x44DD44
    LDI r2, 0x1A1A2E
    DRAWTEXT r6, r8, r5, r0, r2

    ; Draw connection indicator on the right side
    LDI r20, STATUS_CONNECTED
    LOAD r9, r20
    JZ r9, dsb_disconnected

    ; Connected: green dot (0x25CF = filled circle, or just use ASCII)
    LDI r20, SCRATCH
    LDI r9, 42    ; '*' as connected indicator
    STORE r20, r9
    LDI r9, 0
    ADD r20, r6
    STORE r20, r9
    LDI r6, 230
    LDI r8, 1
    LDI r5, SCRATCH
    LDI r0, 0x44FF44
    LDI r2, 0x1A1A2E
    DRAWTEXT r6, r8, r5, r0, r2
    JMP dsb_ret

dsb_disconnected:
    ; Disconnected: red "X"
    LDI r20, SCRATCH
    LDI r9, 88    ; 'X'
    STORE r20, r9
    LDI r9, 0
    ADD r20, r6
    STORE r20, r9
    LDI r6, 230
    LDI r8, 1
    LDI r5, SCRATCH
    LDI r0, 0xFF4444
    LDI r2, 0x1A1A2E
    DRAWTEXT r6, r8, r5, r0, r2

dsb_ret:
    POP r31
    RET

; =========================================
; RENDER -- redraw text buffer using SMALLTEXT (3x5 font)
; Terminal area starts at y=8, uses 6px per row (5px glyph + 1px spacing)
; 40 rows * 6px = 240px. Total: 8 + 240 = 248px (fits in 256px)
; Phase 133: supports horizontal scroll via H_SCROLL
; =========================================
render:
    PUSH r31
    LDI r6, 1

    ; Draw status bar first
    CALL draw_status_bar

    ; Clear content area
    LDI r6, 0
    LDI r8, 8
    LDI r5, 256
    LDI r0, 248
    LDI r2, 0x0A0A0A
    RECTF r6, r8, r5, r0, r2

    ; Load horizontal scroll offset
    LDI r20, H_SCROLL
    LOAD r25, r20        ; r25 = h_scroll (chars to skip)

    LDI r6, 1
    LDI r4, 0           ; row counter
    LDI r3, BUF         ; buf pointer
    LDI r7, 8           ; y position (start after title bar)
render_row:
    ; Copy up to COLS chars to scratch buffer, skipping h_scroll
    LDI r16, SCRATCH
    LDI r17, 0
copy_col:
    LOAD r15, r3
    ; Skip chars before h_scroll offset (fill with spaces)
    LDI r26, 0
    CMP r17, r25
    BGE r9, copy_col_after_skip
    ; Within scroll zone -- write space
    LDI r15, 32
copy_col_after_skip:
    STORE r16, r15
    ADD r3, r6
    ADD r16, r6
    ADD r17, r6
    CMPI r17, COLS
    BLT r17, copy_col
    LDI r9, 0
    STORE r16, r9      ; null-terminate

    ; Render with SMALLTEXT: light gray text, no background
    LDI r6, 0
    LDI r14, SCRATCH
    LDI r13, 0xBBBBBB  ; light gray terminal text
    LDI r11, 0         ; no background (already cleared)
    SMALLTEXT r6, r7, r14, r13, r11

    LDI r6, 1
    ; Advance y by 6 (5px glyph + 1px spacing)
    ADD r7, r6
    ADD r7, r6
    ADD r7, r6
    ADD r7, r6
    ADD r7, r6
    ADD r7, r6

    ADD r4, r6
    CMPI r4, ROWS
    BLT r4, render_row

    ; Cursor blink
    LDI r20, BLINK
    LOAD r9, r20
    LDI r1, 8
    AND r9, r1
    CMPI r9, 4
    BGE r9, cursor_done

draw_cursor:
    ; Cursor: 2px wide, 5px tall at cursor position
    LDI r20, CUR_COL
    LOAD r9, r20
    LDI r1, 3
    MUL r9, r1          ; x = col * 3 (3px per char)
    LDI r20, CUR_ROW
    LOAD r8, r20
    LDI r1, 6
    MUL r8, r1          ; row * 6
    LDI r5, 8
    ADD r8, r5          ; + title bar offset
    LDI r5, 2           ; width
    LDI r0, 5           ; height
    LDI r2, 0x44FF44
    RECTF r9, r8, r5, r0, r2

cursor_done:
    ; Show horizontal scroll indicator if scrolled
    LDI r20, H_SCROLL
    LOAD r9, r20
    JZ r9, no_scroll_indicator
    ; Draw '<' at top-left to indicate horizontal scroll
    LDI r6, 0
    LDI r8, 8
    LDI r20, SCRATCH
    LDI r9, 60    ; '<'
    STORE r20, r9
    LDI r9, 0
    ADD r20, r6
    STORE r20, r9
    LDI r14, SCRATCH
    LDI r13, 0xFFFF00  ; yellow indicator
    LDI r11, 0
    SMALLTEXT r6, r8, r14, r13, r11

no_scroll_indicator:
    POP r31
    RET

; =========================================
; CHECK_RESIZE -- detect WINSYS window size changes
; If WIN_ID > 0, use WINSYS op=6 to get window dimensions,
; calculate new column count, and call PTYSIZE if changed.
; Minimum size: 20 cols, 10 rows.
; Uses: r9-r1, r4-r7 (saved/restored around CALL)
; =========================================
check_resize:
    PUSH r31

    ; Check if WINSYS mode is enabled (WIN_ID != 0)
    LDI r20, WIN_ID
    LOAD r9, r20
    CMPI r9, 0
    JZ r9, cr_done

    ; Save PTY handle
    PUSH r28

    ; WINSYS op=6 (WINFO): r9=win_id, r6=winfo_buf_addr
    LDI r20, WIN_ID
    LOAD r9, r20
    LDI r6, WINFO_BUF
    ; WINSYS op_reg needs to hold the operation number (6)
    LDI r4, 6
    ; Call WINSYS with r4 containing op=6
    ; WINSYS reads op from register at op_reg position
    ; Set r9=win_id, r6=WINFO_BUF, r4=6 for WINSYS r4
    WINSYS r4

    ; Check success (r9=1)
    CMPI r9, 1
    JNZ r9, cr_restore

    ; WINFO wrote [x, y, w, h, z, pid, wx, wy] to WINFO_BUF
    ; w is at WINFO_BUF+2
    LDI r20, WINFO_BUF
    LDI r1, 2
    ADD r20, r1
    LOAD r3, r20     ; r3 = window width in pixels

    ; h is at WINFO_BUF+3
    LDI r20, WINFO_BUF
    LDI r1, 3
    ADD r20, r1
    LOAD r7, r20     ; r7 = window height in pixels

    ; Calculate new_cols = width / 6 (MEDTEXT is 6px per char)
    ; Subtract title bar height (12px) from usable height
    LDI r1, 12
    CMP r7, r1
    BLT r9, cr_restore  ; window too small

    SUB r7, r1        ; usable height
    LDI r1, 8          ; 8px per row
    DIV r7, r1        ; r7 = usable rows

    LDI r1, 6          ; 6px per column (MEDTEXT)
    DIV r3, r1        ; r3 = new_cols

    ; Clamp to minimum 20 cols, 10 rows
    LDI r1, 20
    CMP r3, r1
    BLT r9, cr_clamp_cols
    JMP cr_check_rows
cr_clamp_cols:
    LDI r3, 20
cr_check_rows:
    LDI r1, 10
    CMP r7, r1
    BGE r9, cr_compare
    LDI r7, 10

cr_compare:
    ; Compare new_cols with last known cols
    LDI r20, LAST_COLS
    LOAD r1, r20
    CMP r3, r1
    JZ r9, cr_restore  ; no change

    ; Store new cols
    LDI r20, LAST_COLS
    STORE r20, r3

    ; Call PTYSIZE handle, rows, cols
    LDI r1, PTY_HANDLE
    LOAD r28, r1       ; restore PTY handle for PTYSIZE
    PTYSIZE r28, r7, r3

    ; Fall through to restore r28

cr_restore:
    POP r28

cr_done:
    POP r31
    LDI r6, 1
    RET
