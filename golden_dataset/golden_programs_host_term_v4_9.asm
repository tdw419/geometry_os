; DESCRIPTION: Render a red rectangle at the screen.

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
;   r13  CMP/result
;   r14  constant 1
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
LDI r14, 1
LDI r30, 0xFD00

; Background fill -- dark gray
LDI r13, 0x0A0A0A
FILL r13

; Clear text buffer to spaces (85*40 = 3400 cells)
LDI r20, BUF
LDI r15, 32
LDI r2, 3400
clear_buf_init:
    STORE r20, r15
    ADD r20, r14
    CMPI r20, BUF_END
    BLT r13, clear_buf_init

; Cursor + blink + handle + ansi_state init
LDI r20, CUR_COL
LDI r13, 0
STORE r20, r13
LDI r20, CUR_ROW
STORE r20, r13
LDI r20, BLINK
STORE r20, r13
LDI r20, PTY_HANDLE
LDI r13, 0xFFFF
STORE r20, r13
LDI r20, ANSI_STATE
LDI r13, 0
STORE r20, r13
LDI r20, STATUS_CONNECTED
STORE r20, r13
LDI r20, STATUS_CWD_LEN
STORE r20, r13
LDI r20, OSC_LEN
STORE r20, r13

; Phase 133: init dynamic sizing vars
LDI r20, H_SCROLL
STORE r20, r13
LDI r20, COLS_RAM
LDI r13, COLS
STORE r20, r13
LDI r20, ROWS_RAM
LDI r13, ROWS
STORE r20, r13
LDI r13, 0

; Initialize resize tracking (WINSYS window ID = 0 = disabled)
LDI r20, WIN_ID
STORE r20, r13
LDI r20, LAST_COLS
LDI r13, COLS
STORE r20, r13
LDI r13, 0

; Title bar background (8px tall for SMALLTEXT)
LDI r14, 0
LDI r12, 0
LDI r5, 256
LDI r3, 8
LDI r0, 0x1A1A2E
RECTF r14, r12, r5, r3, r0

; Title text (using DRAWTEXT for readability in title bar)
LDI r20, SCRATCH
STRO r20, "shell"
LDI r14, 2
LDI r12, 1
LDI r5, SCRATCH
LDI r3, 0x44DD44
LDI r0, 0x1A1A2E
DRAWTEXT r14, r12, r5, r3, r0

; Close button hit region
LDI r14, 230
LDI r12, 0
LDI r5, 26
LDI r3, 8
HITSET r14, r12, r5, r3, 99

; Empty cmd string for PTYOPEN
LDI r14, CMD_BUF
LDI r13, 0
STORE r14, r13

; PTYOPEN
LDI r0, CMD_BUF
PTYOPEN r0, r6

; Save handle and mark connected
LDI r20, PTY_HANDLE
STORE r20, r6
LDI r28, 0
ADD r28, r6
LDI r20, STATUS_CONNECTED
LDI r13, 1
STORE r20, r13

; r14 = 1 (restore after earlier code clobbered it)
LDI r14, 1

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
    LDI r4, 512
    PTYREAD r28, r15, r4
    MOV r11, r13
    CMPI r11, 0
    JZ r13, startup_check_done
    LDI r4, 0xFFFFFFFF
    CMP r11, r4
    JZ r13, pty_closed

    ; Process received bytes
    LDI r7, 0
startup_append:
    CMP r7, r11
    BGE r13, startup_after
    LDI r20, RECV_BUF
    ADD r20, r7
    LOAD r0, r20
    CALL process_byte
    ADD r7, r14
    JMP startup_append
startup_after:
    LDI r21, 1      ; mark as received

startup_check_done:
    CALL render
    FRAME
    ADD r22, r14
    CMPI r22, 60
    BLT r22, startup_drain

; If no output received after 60 frames, probe with echo
CMPI r21, 0
JNZ r13, startup_done

; Show "[probing...]" and send echo to trigger output
LDI r20, SEND_BUF
STRO r20, "[probing...]"
CALL write_str_to_buf
CALL render
FRAME

; Send "echo ready\n" to probe the PTY
LDI r20, SEND_BUF
LDI r13, 101
STORE r20, r13
LDI r20, SEND_BUF
ADD r20, r14
LDI r13, 99
STORE r20, r13
LDI r20, SEND_BUF
LDI r12, 2
ADD r20, r12
LDI r13, 104
STORE r20, r13
LDI r20, SEND_BUF
LDI r12, 3
ADD r20, r12
LDI r13, 111
STORE r20, r13
LDI r20, SEND_BUF
LDI r12, 4
ADD r20, r12
LDI r13, 32
STORE r20, r13
LDI r20, SEND_BUF
LDI r12, 5
ADD r20, r12
LDI r13, 114
STORE r20, r13
LDI r20, SEND_BUF
LDI r12, 6
ADD r20, r12
LDI r13, 101
STORE r20, r13
LDI r20, SEND_BUF
LDI r12, 7
ADD r20, r12
LDI r13, 97
STORE r20, r13
LDI r20, SEND_BUF
LDI r12, 8
ADD r20, r12
LDI r13, 100
STORE r20, r13
LDI r20, SEND_BUF
LDI r12, 9
ADD r20, r12
LDI r13, 121
STORE r20, r13
LDI r20, SEND_BUF
LDI r12, 10
ADD r20, r12
LDI r13, 10
STORE r20, r13

LDI r15, SEND_BUF
LDI r4, 11
PTYWRITE r28, r15, r4

; Drain probe response for 30 more frames
LDI r22, 0
probe_drain:
    LDI r15, RECV_BUF
    LDI r4, 512
    PTYREAD r28, r15, r4
    MOV r11, r13
    CMPI r11, 0
    JZ r13, probe_next
    LDI r4, 0xFFFFFFFF
    CMP r11, r4
    JZ r13, pty_closed
    LDI r7, 0
probe_append:
    CMP r7, r11
    BGE r13, probe_after
    LDI r20, RECV_BUF
    ADD r20, r7
    LOAD r0, r20
    CALL process_byte
    ADD r7, r14
    JMP probe_append
probe_after:
    LDI r21, 1
probe_next:
    CALL render
    FRAME
    ADD r22, r14
    CMPI r22, 30
    BLT r22, probe_drain

startup_done:
    LDI r14, 1

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r14, 1

    ; Check for window resize (WINSYS mode)
    CALL check_resize

    ; Drain pty into text buffer
    LDI r15, RECV_BUF
    LDI r4, 512
    PTYREAD r28, r15, r4
    ; r13 = bytes drained (0 = nothing, 0xFFFFFFFF = closed)
    ; Save byte count before CMPI destroys it
    MOV r11, r13
    CMPI r11, 0
    JZ r13, after_drain
    LDI r4, 0xFFFFFFFF
    CMP r11, r4
    JZ r13, pty_closed

    ; Process each byte through ANSI filter -> text buffer
    LDI r7, 0
append_loop:
    CMP r7, r11
    BGE r13, after_drain
    LDI r20, RECV_BUF
    ADD r20, r7
    LOAD r0, r20
    CALL process_byte
    ADD r7, r14
    JMP append_loop

pty_closed:
    ; Mark disconnected
    LDI r20, STATUS_CONNECTED
    LDI r13, 0
    STORE r20, r13
    ; Show message and stop
    LDI r20, SEND_BUF
    STRO r20, "[pty closed]"
    CALL write_str_to_buf
    JMP after_drain

after_drain:
    LDI r14, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r13, r20
    ADD r13, r14
    STORE r20, r13

    ; Render
    CALL render
    FRAME

    ; Read keystroke
    IKEY r0
    JZ r0, main_loop

    ; Translate key and send to PTY
    CALL translate_key
    ; r13 = number of bytes to send (0 = ignore, 1 = single, 3 = arrow escape)
    CMPI r13, 0
    JZ r13, main_loop

    ; Send bytes from SEND_BUF
    LDI r15, SEND_BUF
    PTYWRITE r28, r15, r13
    JMP main_loop

; =========================================
; PROCESS_BYTE -- ANSI state machine + text buffer append
; r0 = byte from PTY
; Uses ANSI_STATE at 0x4A04
; =========================================
process_byte:
    PUSH r31
    LDI r14, 1

    ; Load ANSI state
    LDI r20, ANSI_STATE
    LOAD r3, r20

    ; State: NORMAL
    CMPI r3, ANS_NORMAL
    JNZ r13, pb_check_esc

    ; Check for ESC (0x1B)
    CMPI r0, 27
    JNZ r13, pb_normal_byte

    ; Saw ESC -> transition to ESC state
    LDI r20, ANSI_STATE
    LDI r13, ANS_ESC
    STORE r20, r13
    JMP pb_ret

pb_normal_byte:
    ; Pass through to append_byte
    CALL append_byte
    JMP pb_ret

pb_check_esc:
    ; State: ESC (just saw 0x1B)
    CMPI r3, ANS_ESC
    JNZ r13, pb_check_csi

    ; Check for [ -> CSI
    CMPI r0, 91   ; '['
    JNZ r13, pb_esc_check_osc

    LDI r20, ANSI_STATE
    LDI r13, ANS_CSI
    STORE r20, r13
    JMP pb_ret

pb_esc_check_osc:
    ; Check for ] -> OSC
    CMPI r0, 93   ; ']'
    JNZ r13, pb_esc_other

    LDI r20, ANSI_STATE
    LDI r13, ANS_OSC
    STORE r20, r13
    JMP pb_ret

pb_esc_other:
    ; Any other char after ESC: not a recognized sequence.
    ; Two-char ESC sequences (ESC M, ESC 7, ESC 8) -- skip.
    LDI r20, ANSI_STATE
    LDI r13, ANS_NORMAL
    STORE r20, r13
    JMP pb_ret

pb_check_csi:
    ; State: CSI (saw ESC [)
    CMPI r3, ANS_CSI
    JNZ r13, pb_check_osc

    ; CSI sequences end with a byte in 0x40-0x7E (letter or @)
    CMPI r0, 64    ; '@' -- first terminator
    BLT r13, pb_csi_continue

    ; Byte >= 0x40 is a terminator -> sequence done
    LDI r20, ANSI_STATE
    LDI r13, ANS_NORMAL
    STORE r20, r13
    JMP pb_ret

pb_csi_continue:
    ; Still collecting CSI params
    JMP pb_ret

pb_check_osc:
    ; State: OSC (saw ESC ])
    CMPI r3, ANS_OSC
    JNZ r13, pb_reset_state

    ; OSC ends with BEL (0x07) or ST (ESC \)
    CMPI r0, 7     ; BEL
    JZ r13, pb_osc_end
    CMPI r0, 27
    JNZ r13, pb_osc_continue
    ; ESC might be start of ST
    LDI r20, ANSI_STATE
    LDI r13, ANS_ESC
    STORE r20, r13
    JMP pb_ret

pb_osc_continue:
    ; Collect OSC byte into buffer (max 80 chars)
    LDI r20, OSC_LEN
    LOAD r13, r20
    LDI r4, 80
    CMP r13, r4
    BGE r13, pb_ret
    LDI r4, OSC_BUF
    ADD r4, r13
    STORE r4, r0
    ADD r13, r14
    STORE r20, r13
    JMP pb_ret

pb_osc_end:
    ; Process collected OSC sequence
    CALL process_osc
    LDI r20, ANSI_STATE
    LDI r13, ANS_NORMAL
    STORE r20, r13
    JMP pb_ret

pb_reset_state:
    LDI r20, ANSI_STATE
    LDI r13, ANS_NORMAL
    STORE r20, r13

pb_ret:
    POP r31
    RET

; =========================================
; APPEND_BYTE -- append r0 to text buffer (visible chars only)
; \n (10) -> newline; \r (13) -> col=0; printable -> insert
; =========================================
append_byte:
    PUSH r31
    LDI r14, 1

    ; Newline
    CMPI r0, 10
    JNZ r13, ab_check_cr
    CALL do_newline
    JMP ab_ret

ab_check_cr:
    CMPI r0, 13
    JNZ r13, ab_check_print
    LDI r20, CUR_COL
    LDI r13, 0
    STORE r20, r13
    JMP ab_ret

ab_check_print:
    ; printable range 32..126 inclusive
    CMPI r0, 32
    BLT r13, ab_ret
    CMPI r0, 127
    BGE r13, ab_ret

    ; buf[row*COLS + col] = r0
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r5, COLS
    MUL r12, r5
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r12, r13
    LDI r20, BUF
    ADD r20, r12
    STORE r20, r0

    ; col++
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r13, r14
    STORE r20, r13
    CMPI r13, COLS
    JNZ r13, ab_ret
    CALL do_newline

ab_ret:
    POP r31
    RET

; =========================================
; TRANSLATE_KEY -- translate IKEY code to PTY byte(s)
; Fills SEND_BUF with bytes, returns byte count in r13
; r0 = raw IKEY value (preserved)
; =========================================
translate_key:
    PUSH r31
    LDI r14, 1

    ; Printable ASCII (32-126): pass through as single byte
    CMPI r0, 32
    BLT r13, tk_special
    CMPI r0, 127
    BGE r13, tk_special
    LDI r20, SEND_BUF
    STORE r20, r0
    LDI r13, 1
    JMP tk_ret

tk_special:
    ; Enter (0x0D) -> \n (10)
    CMPI r0, 13
    JNZ r13, tk_bs
    LDI r20, SEND_BUF
    LDI r13, 10
    STORE r20, r13
    LDI r13, 1
    JMP tk_ret

tk_bs:
    ; Backspace (0x08) -> DEL (0x7F)
    CMPI r0, 8
    JNZ r13, tk_del
    LDI r20, SEND_BUF
    LDI r13, 127
    STORE r20, r13
    LDI r13, 1
    JMP tk_ret

tk_del:
    ; Delete (0x7F) -> ESC [ 3 ~ (just send DEL for simplicity)
    CMPI r0, 127
    JNZ r13, tk_tab
    LDI r20, SEND_BUF
    LDI r13, 127
    STORE r20, r13
    LDI r13, 1
    JMP tk_ret

tk_tab:
    CMPI r0, 9
    JNZ r13, tk_ctrl_c
    LDI r20, SEND_BUF
    LDI r13, 9
    STORE r20, r13
    LDI r13, 1
    JMP tk_ret

tk_ctrl_c:
    ; Ctrl-C: check for ASCII 3
    CMPI r0, 3
    JNZ r13, tk_ctrl_d
    LDI r20, SEND_BUF
    LDI r13, 3
    STORE r20, r13
    LDI r13, 1
    JMP tk_ret

tk_ctrl_d:
    CMPI r0, 4
    JNZ r13, tk_escape
    LDI r20, SEND_BUF
    LDI r13, 4
    STORE r20, r13
    LDI r13, 1
    JMP tk_ret

tk_escape:
    CMPI r0, 27
    JNZ r13, tk_arrow_up
    LDI r20, SEND_BUF
    LDI r13, 27
    STORE r20, r13
    LDI r13, 1
    JMP tk_ret

tk_arrow_up:
    ; Arrow Up (0x80) -> ESC [ A
    CMPI r0, KEY_UP
    JNZ r13, tk_arrow_down
    LDI r20, SEND_BUF
    LDI r13, 27
    STORE r20, r13
    LDI r20, SEND_BUF
    ADD r20, r14
    LDI r13, 91
    STORE r20, r13
    LDI r20, SEND_BUF
    LDI r12, 2
    ADD r20, r12
    LDI r13, 65
    STORE r20, r13
    LDI r13, 3
    JMP tk_ret

tk_arrow_down:
    ; Arrow Down (0x81) -> ESC [ B
    CMPI r0, KEY_DOWN
    JNZ r13, tk_arrow_right
    LDI r20, SEND_BUF
    LDI r13, 27
    STORE r20, r13
    LDI r20, SEND_BUF
    ADD r20, r14
    LDI r13, 91
    STORE r20, r13
    LDI r20, SEND_BUF
    LDI r12, 2
    ADD r20, r12
    LDI r13, 66
    STORE r20, r13
    LDI r13, 3
    JMP tk_ret

tk_arrow_right:
    ; Arrow Right (0x83) -> ESC [ C
    CMPI r0, KEY_RIGHT
    JNZ r13, tk_arrow_left
    LDI r20, SEND_BUF
    LDI r13, 27
    STORE r20, r13
    LDI r20, SEND_BUF
    ADD r20, r14
    LDI r13, 91
    STORE r20, r13
    LDI r20, SEND_BUF
    LDI r12, 2
    ADD r20, r12
    LDI r13, 67
    STORE r20, r13
    LDI r13, 3
    JMP tk_ret

tk_arrow_left:
    ; Arrow Left (0x82) -> ESC [ D
    CMPI r0, KEY_LEFT
    JNZ r13, tk_home
    LDI r20, SEND_BUF
    LDI r13, 27
    STORE r20, r13
    LDI r20, SEND_BUF
    ADD r20, r14
    LDI r13, 91
    STORE r20, r13
    LDI r20, SEND_BUF
    LDI r12, 2
    ADD r20, r12
    LDI r13, 68
    STORE r20, r13
    LDI r13, 3
    JMP tk_ret

tk_home:
    ; Home (0x84) -> ESC [ H
    CMPI r0, KEY_HOME
    JNZ r13, tk_end
    LDI r20, SEND_BUF
    LDI r13, 27
    STORE r20, r13
    LDI r20, SEND_BUF
    ADD r20, r14
    LDI r13, 91
    STORE r20, r13
    LDI r20, SEND_BUF
    LDI r12, 2
    ADD r20, r12
    LDI r13, 72
    STORE r20, r13
    LDI r13, 3
    JMP tk_ret

tk_end:
    ; End (0x85) -> ESC [ F
    CMPI r0, KEY_END
    JNZ r13, tk_ignore
    LDI r20, SEND_BUF
    LDI r13, 27
    STORE r20, r13
    LDI r20, SEND_BUF
    ADD r20, r14
    LDI r13, 91
    STORE r20, r13
    LDI r20, SEND_BUF
    LDI r12, 2
    ADD r20, r12
    LDI r13, 70
    STORE r20, r13
    LDI r13, 3
    JMP tk_ret

tk_ignore:
    ; Unknown key -- don't send anything
    LDI r13, 0

tk_ret:
    POP r31
    RET

; =========================================
; DO_NEWLINE -- col=0, row++ or scroll
; =========================================
do_newline:
    PUSH r31
    LDI r14, 1
    LDI r20, CUR_COL
    LDI r13, 0
    STORE r20, r13
    LDI r20, CUR_ROW
    LOAD r15, r20
    ADD r15, r14
    CMPI r15, ROWS
    BLT r13, dn_store
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
    LDI r14, 1
    LDI r6, 0
scroll_loop:
    CMPI r6, 29
    BGE r13, scroll_clear

    LDI r20, BUF
    LDI r13, 0
    ADD r13, r6
    ADD r13, r14
    LDI r8, COLS
    MUL r13, r8
    ADD r20, r13          ; src = BUF + (row+1)*COLS

    LDI r21, BUF
    LDI r13, 0
    ADD r13, r6
    LDI r8, COLS
    MUL r13, r8
    ADD r21, r13          ; dst = BUF + row*COLS

    LDI r22, 0
scroll_copy:
    LOAD r13, r20
    STORE r21, r13
    ADD r20, r14
    ADD r21, r14
    ADD r22, r14
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r6, r14
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r15, 29
    LDI r8, COLS
    MUL r15, r8
    ADD r20, r15
    LDI r15, 32
    LDI r22, 0
sc_loop:
    STORE r20, r15
    ADD r20, r14
    ADD r22, r14
    CMPI r22, COLS
    BLT r13, sc_loop
    POP r31
    RET

; =========================================
; WRITE_STR_TO_BUF -- write null-term string at [r20] to text buffer
; =========================================
write_str_to_buf:
    PUSH r31
    PUSH r20
    LDI r14, 1
wsb_loop:
    LOAD r0, r20
    JZ r0, wsb_done
    CALL append_byte
    ADD r20, r14
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
    LDI r14, 1

    ; Check if OSC starts with '7' (OSC 7 = set working directory)
    LDI r20, OSC_BUF
    LOAD r13, r20
    CMPI r13, 55    ; '7' = 55
    JNZ r13, po_done

    ; Check second byte is ';' (59)
    LDI r20, OSC_BUF
    ADD r20, r14
    LOAD r13, r20
    CMPI r13, 59    ; ';'
    JNZ r13, po_done

    ; Extract path from "7;file://HOST/PATH"
    ; Find the 3rd '/' (after file://host)
    LDI r6, 0     ; position in OSC_BUF
    LDI r8, 0     ; slash count
po_find_path:
    LDI r20, OSC_BUF
    ADD r20, r6
    LOAD r13, r20
    JZ r13, po_done  ; null terminator, no path found
    CMPI r13, 47    ; '/'
    JNZ r13, po_next
    ADD r8, r14
    ; After 3 slashes, we're at the path
    CMPI r8, 3
    BGE r13, po_copy_path
po_next:
    ADD r6, r14
    LDI r4, 80
    CMP r6, r4
    BLT r13, po_find_path
    JMP po_done

po_copy_path:
    ; r6 points to the 3rd '/' -- copy from there into STATUS_CWD
    LDI r9, 0     ; cwd offset
po_cp_loop:
    LDI r20, OSC_BUF
    ADD r20, r6
    LOAD r13, r20
    JZ r13, po_cp_done
    LDI r4, STATUS_CWD
    ADD r4, r9
    STORE r4, r13
    ADD r6, r14
    ADD r9, r14
    LDI r4, 60
    CMP r9, r4
    BLT r13, po_cp_loop
po_cp_done:
    ; Null-terminate and store length
    LDI r4, STATUS_CWD
    ADD r4, r9
    LDI r13, 0
    STORE r4, r13
    LDI r20, STATUS_CWD_LEN
    STORE r20, r9

po_done:
    ; Reset OSC buffer
    LDI r20, OSC_LEN
    LDI r13, 0
    STORE r20, r13
    POP r31
    RET

; =========================================
; DRAW_STATUS_BAR -- render title bar with shell info
; Shows: "bash: ~/path" + connected indicator on the right
; =========================================
draw_status_bar:
    PUSH r31
    LDI r14, 1

    ; Clear title bar area
    LDI r14, 0
    LDI r12, 0
    LDI r5, 256
    LDI r3, 10
    LDI r0, 0x1A1A2E
    RECTF r14, r12, r5, r3, r0

    ; Build status string in SCRATCH: "bash: " + cwd
    LDI r20, SCRATCH
    STRO r20, "bash: "
    ; Append cwd
    LDI r20, SCRATCH
    ; Find end of "bash: " (6 chars)
    LDI r6, 0
dsb_find_end:
    LDI r4, SCRATCH
    ADD r4, r6
    LOAD r13, r4
    JZ r13, dsb_append_cwd
    ADD r6, r14
    JMP dsb_find_end

dsb_append_cwd:
    ; Check if we have a cwd
    LDI r20, STATUS_CWD_LEN
    LOAD r13, r20
    JZ r13, dsb_no_cwd

    ; Append cwd chars
    LDI r8, 0
dsb_cp:
    LDI r4, STATUS_CWD
    ADD r4, r8
    LOAD r13, r4
    JZ r13, dsb_cp_done
    LDI r4, SCRATCH
    ADD r4, r6
    STORE r4, r13
    ADD r6, r14
    ADD r8, r14
    LDI r4, 38     ; max 38 chars for title
    CMP r6, r4
    BLT r13, dsb_cp
    JMP dsb_cp_done

dsb_no_cwd:
    ; No cwd known yet -- show "~"
    LDI r4, SCRATCH
    ADD r4, r6
    LDI r13, 126    ; '~'
    STORE r4, r13
    ADD r6, r14

dsb_cp_done:
    ; Null-terminate
    LDI r4, SCRATCH
    ADD r4, r6
    LDI r13, 0
    STORE r4, r13

    ; Draw the status text
    LDI r14, 2
    LDI r12, 1
    LDI r5, SCRATCH
    LDI r3, 0x44DD44
    LDI r0, 0x1A1A2E
    DRAWTEXT r14, r12, r5, r3, r0

    ; Draw connection indicator on the right side
    LDI r20, STATUS_CONNECTED
    LOAD r13, r20
    JZ r13, dsb_disconnected

    ; Connected: green dot (0x25CF = filled circle, or just use ASCII)
    LDI r20, SCRATCH
    LDI r13, 42    ; '*' as connected indicator
    STORE r20, r13
    LDI r13, 0
    ADD r20, r14
    STORE r20, r13
    LDI r14, 230
    LDI r12, 1
    LDI r5, SCRATCH
    LDI r3, 0x44FF44
    LDI r0, 0x1A1A2E
    DRAWTEXT r14, r12, r5, r3, r0
    JMP dsb_ret

dsb_disconnected:
    ; Disconnected: red "X"
    LDI r20, SCRATCH
    LDI r13, 88    ; 'X'
    STORE r20, r13
    LDI r13, 0
    ADD r20, r14
    STORE r20, r13
    LDI r14, 230
    LDI r12, 1
    LDI r5, SCRATCH
    LDI r3, 0xFF4444
    LDI r0, 0x1A1A2E
    DRAWTEXT r14, r12, r5, r3, r0

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
    LDI r14, 1

    ; Draw status bar first
    CALL draw_status_bar

    ; Clear content area
    LDI r14, 0
    LDI r12, 8
    LDI r5, 256
    LDI r3, 248
    LDI r0, 0x0A0A0A
    RECTF r14, r12, r5, r3, r0

    ; Load horizontal scroll offset
    LDI r20, H_SCROLL
    LOAD r25, r20        ; r25 = h_scroll (chars to skip)

    LDI r14, 1
    LDI r6, 0           ; row counter
    LDI r8, BUF         ; buf pointer
    LDI r9, 8           ; y position (start after title bar)
render_row:
    ; Copy up to COLS chars to scratch buffer, skipping h_scroll
    LDI r16, SCRATCH
    LDI r17, 0
copy_col:
    LOAD r15, r8
    ; Skip chars before h_scroll offset (fill with spaces)
    LDI r26, 0
    CMP r17, r25
    BGE r13, copy_col_after_skip
    ; Within scroll zone -- write space
    LDI r15, 32
copy_col_after_skip:
    STORE r16, r15
    ADD r8, r14
    ADD r16, r14
    ADD r17, r14
    CMPI r17, COLS
    BLT r17, copy_col
    LDI r13, 0
    STORE r16, r13      ; null-terminate

    ; Render with SMALLTEXT: light gray text, no background
    LDI r14, 0
    LDI r1, SCRATCH
    LDI r10, 0xBBBBBB  ; light gray terminal text
    LDI r2, 0         ; no background (already cleared)
    SMALLTEXT r14, r9, r1, r10, r2

    LDI r14, 1
    ; Advance y by 6 (5px glyph + 1px spacing)
    ADD r9, r14
    ADD r9, r14
    ADD r9, r14
    ADD r9, r14
    ADD r9, r14
    ADD r9, r14

    ADD r6, r14
    CMPI r6, ROWS
    BLT r6, render_row

    ; Cursor blink
    LDI r20, BLINK
    LOAD r13, r20
    LDI r4, 8
    AND r13, r4
    CMPI r13, 4
    BGE r13, cursor_done

draw_cursor:
    ; Cursor: 2px wide, 5px tall at cursor position
    LDI r20, CUR_COL
    LOAD r13, r20
    LDI r4, 3
    MUL r13, r4          ; x = col * 3 (3px per char)
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r4, 6
    MUL r12, r4          ; row * 6
    LDI r5, 8
    ADD r12, r5          ; + title bar offset
    LDI r5, 2           ; width
    LDI r3, 5           ; height
    LDI r0, 0x44FF44
    RECTF r13, r12, r5, r3, r0

cursor_done:
    ; Show horizontal scroll indicator if scrolled
    LDI r20, H_SCROLL
    LOAD r13, r20
    JZ r13, no_scroll_indicator
    ; Draw '<' at top-left to indicate horizontal scroll
    LDI r14, 0
    LDI r12, 8
    LDI r20, SCRATCH
    LDI r13, 60    ; '<'
    STORE r20, r13
    LDI r13, 0
    ADD r20, r14
    STORE r20, r13
    LDI r1, SCRATCH
    LDI r10, 0xFFFF00  ; yellow indicator
    LDI r2, 0
    SMALLTEXT r14, r12, r1, r10, r2

no_scroll_indicator:
    POP r31
    RET

; =========================================
; CHECK_RESIZE -- detect WINSYS window size changes
; If WIN_ID > 0, use WINSYS op=6 to get window dimensions,
; calculate new column count, and call PTYSIZE if changed.
; Minimum size: 20 cols, 10 rows.
; Uses: r13-r4, r6-r9 (saved/restored around CALL)
; =========================================
check_resize:
    PUSH r31

    ; Check if WINSYS mode is enabled (WIN_ID != 0)
    LDI r20, WIN_ID
    LOAD r13, r20
    CMPI r13, 0
    JZ r13, cr_done

    ; Save PTY handle
    PUSH r28

    ; WINSYS op=6 (WINFO): r13=win_id, r14=winfo_buf_addr
    LDI r20, WIN_ID
    LOAD r13, r20
    LDI r14, WINFO_BUF
    ; WINSYS op_reg needs to hold the operation number (6)
    LDI r6, 6
    ; Call WINSYS with r6 containing op=6
    ; WINSYS reads op from register at op_reg position
    ; Set r13=win_id, r14=WINFO_BUF, r6=6 for WINSYS r6
    WINSYS r6

    ; Check success (r13=1)
    CMPI r13, 1
    JNZ r13, cr_restore

    ; WINFO wrote [x, y, w, h, z, pid, wx, wy] to WINFO_BUF
    ; w is at WINFO_BUF+2
    LDI r20, WINFO_BUF
    LDI r4, 2
    ADD r20, r4
    LOAD r8, r20     ; r8 = window width in pixels

    ; h is at WINFO_BUF+3
    LDI r20, WINFO_BUF
    LDI r4, 3
    ADD r20, r4
    LOAD r9, r20     ; r9 = window height in pixels

    ; Calculate new_cols = width / 6 (MEDTEXT is 6px per char)
    ; Subtract title bar height (12px) from usable height
    LDI r4, 12
    CMP r9, r4
    BLT r13, cr_restore  ; window too small

    SUB r9, r4        ; usable height
    LDI r4, 8          ; 8px per row
    DIV r9, r4        ; r9 = usable rows

    LDI r4, 6          ; 6px per column (MEDTEXT)
    DIV r8, r4        ; r8 = new_cols

    ; Clamp to minimum 20 cols, 10 rows
    LDI r4, 20
    CMP r8, r4
    BLT r13, cr_clamp_cols
    JMP cr_check_rows
cr_clamp_cols:
    LDI r8, 20
cr_check_rows:
    LDI r4, 10
    CMP r9, r4
    BGE r13, cr_compare
    LDI r9, 10

cr_compare:
    ; Compare new_cols with last known cols
    LDI r20, LAST_COLS
    LOAD r4, r20
    CMP r8, r4
    JZ r13, cr_restore  ; no change

    ; Store new cols
    LDI r20, LAST_COLS
    STORE r20, r8

    ; Call PTYSIZE handle, rows, cols
    LDI r4, PTY_HANDLE
    LOAD r28, r4       ; restore PTY handle for PTYSIZE
    PTYSIZE r28, r9, r8

    ; Fall through to restore r28

cr_restore:
    POP r28

cr_done:
    POP r31
    LDI r14, 1
    RET
