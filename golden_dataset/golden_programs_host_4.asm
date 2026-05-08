; DESCRIPTION: Display a object using color colored at the screen.

1. **Initialization**:
   - The terminal area is initialized with a dark background.
   - The text buffer (`BUF`) is filled with spaces to clear the screen initially.

2. **Input Handling**:
   - The main loop reads characters from standard input (stdin).
   - It processes ASCII control characters (like backspace, newline) and printable characters.
   - It handles ANSI escape codes for cursor movement, color changes, etc.

3. **Text Rendering**:
   - Text is rendered using a simple 5x8 pixel font.
   - The `render` function updates the screen based on the text buffer (`BUF`) and cursor position.
   - It uses a "dirty rectangle" optimization to only redraw changed parts of the screen.

4. **Cursor Handling**:
   - The terminal maintains a cursor position that can be moved using escape codes.
   - The cursor blinks at a rate determined by the blink counter.

5. **ANSI Escape Code Support**:
   - Basic support for ANSI colors and styles (bold, underline).
   - Cursor movement commands like moving to a specific position, saving/restoring cursor state.

6. **Screen Buffering**:
   - The terminal uses separate buffers for text and color information.
   - This allows for colored text rendering.

7. **Alt Screen Buffer**:
   - Simulated "alternate screen buffer" support using escape codes to switch between main and alt screens.

8. **Scrolling**:
   - Basic scrolling functionality is implemented to handle overflow of text beyond the visible area.

9. **Error Handling**:
   - The code includes basic error handling for unsupported escape codes and invalid input.

10. **Performance Considerations**:
    - The use of dirty rectangle optimization helps in reducing unnecessary redraws, improving performance.
    - Efficient loop unrolling and register usage are employed to optimize the rendering process.

This terminal emulator is designed to run on a bare-metal system with direct memory access for graphics operations, as indicated by calls like `RECTF` and `SMALLTEXT`. The code leverages assembly language's low-level control over hardware resources to provide efficient terminal functionality.

; host_term.asm -- Host Shell Terminal for Geometry OS (v6)
;
; Spawns bash inside a real PTY via the PTYOPEN opcode. Pipes keystrokes
; through PTYWRITE, drains PTY output through PTYREAD each frame.
;
; v6 improvements (Phase 132: ANSI Color Rendering):
;   - SGR (Set Graphics Rendition) color support
;   - Per-character color buffer parallel to text buffer
;   - ANSI 16-color palette (standard + bright)
;   - Color-run rendering for efficient display
;
; v5 improvements (Phase 133: Wider Display):
;   - SMALLTEXT opcode (3x5 font) for 80 readable columns
;   - 80x40 terminal (standard 80 cols, 40 rows) via PTYSIZE
;   - Arrow key support (ESC [ A/B/C/D sequences)
;   - Shift-aware lowercase text input
;   - ANSI escape stripping (CSI + OSC sequences)
;   - Backspace/Delete, Ctrl-C (0x03), Ctrl-D (0x04), Tab (0x09)
;
; RAM Layout:
;   0x4000-0x77FF  Text buffer (80*47 = 3760 u32 cells, row-major)
;   0x4E00         Cursor column
;   0x4E01         Cursor row
;   0x4E02         Blink counter
;   0x4E03         PTY handle
;   0x4E04         ANSI state
;   0x4E05         STATUS_CONNECTED
;   0x4E06         STATUS_CWD_LEN
;   0x4E07         OSC_LEN
;   0x4E08         SCROLL_X (horizontal scroll offset)
;   0x4E09         FG_COLOR (current foreground color, default 0xBBBBBB)
;   0x4E0A         CSI_PARAM (accumulated SGR parameter)
;   0x5000         Empty cmd string
;   0x5400         Send buffer
;   0x5800-0x5FFF  Receive buffer (2048 cells)
;   0x6000-0x60FF  Scratch buffer for SMALLTEXT rendering (128 chars)
;   0x6100-0x613F  STATUS_CWD (64 chars max)
;   0x6200-0x6250  OSC_BUF (80 chars max)
;   0x7800-0x847F  Color buffer (80*40 = 3200 u32 cells, parallel to text buffer)
;
; Registers:
;   r8  CMP/result
;   r4  constant 1
;   r28 PTY handle (live copies)
;   r30 stack pointer
;
#define COLS 80
#define ROWS 30
#define BUF 0x4000
#define BUF_END 0x4960
#define CUR_COL 0x4E00
#define CUR_ROW 0x4E01
#define BLINK 0x4E02
#define PTY_HANDLE 0x4E03
#define ANSI_STATE 0x4E04
#define STATUS_CONNECTED 0x4E05
#define STATUS_CWD_LEN 0x4E06
#define OSC_LEN 0x4E07
#define SCROLL_X 0x4E08
#define FG_COLOR 0x4E09
#define CSI_PARAM 0x4E0A
#define UTF8_CP 0x4E0B
#define CSI_PARAM2 0x4E0C
#define DIRTY_STATUS 0x4E0D
#define CSI_PRIVATE 0x4E0E    ; 1 if '?' seen in CSI sequence (private mode)
#define SGR_EXTENDED 0x4E12   ; Extended SGR state: 0=normal, 38=fg pending, 48=bg pending, 0x85=fg256 waiting, 0x95=bg256 waiting
#define ALT_ACTIVE 0x4E0F     ; 1 if alternate screen buffer active
#define ALT_SAVE_ROW 0x4E10   ; saved cursor row for alt screen
#define ALT_SAVE_COL 0x4E11   ; saved cursor col for alt screen
#define STATUS_CWD 0x6100
#define CMD_BUF 0x5000
#define SEND_BUF 0x5400
#define RECV_BUF 0x5800
#define SCRATCH 0x6000
#define OSC_BUF 0x6200
#define COLOR_BUF 0x7800
#define COLOR_END 0x8160      ; COLOR_BUF + 80*30 = 2400 cells

; ANSI states
#define ANS_NORMAL 0
#define ANS_ESC    1
#define ANS_CSI    2
#define ANS_OSC    3
#define ANS_UTF8_2 4
#define ANS_UTF8_3A 5
#define ANS_UTF8_3B 6

; Extended key codes (from keys.rs)
#define KEY_UP    0x80
#define KEY_DOWN  0x81
#define KEY_LEFT  0x82
#define KEY_RIGHT 0x83
#define KEY_HOME  0x84
#define KEY_END   0x85

; UTF-8 decoding accumulator
#define UTF8_CP 0x4E0B
; CSI second parameter (row for H, unused for most others)
#define CSI_PARAM2 0x4E0C
; Dirty flag for status bar (1 = needs redraw)
#define DIRTY_STATUS 0x4E0D
#define SAVED_ROW 0x4E13   ; ESC 7 saved cursor row
#define SAVED_COL 0x4E14   ; ESC 7 saved cursor col
#define SAVED_FG 0x4E15    ; ESC 7 saved FG color
#define DIRTY_ROWS 0x4E16  ; 32-bit dirty row bitmap (bit N = row N needs redraw)
#define SCROLL_TOP 0x4E17  ; Scroll region top row (0-based, default 0)
#define SCROLL_BOT 0x4E18  ; Scroll region bottom row (0-based, default ROWS-1)
#define TAB_STOPS 0x4E19   ; Tab stop bitmap: 3 u32 words (80 bits, bit N = column N has tab stop)
#define RENDERED_ROWS 0x4E1A ; Count of dirty rows rendered this frame (debug perf)

; =========================================
; INIT
; =========================================
LDI r4, 1
LDI r30, 0xFD00

; Background fill -- dark gray
LDI r8, 0x0A0A0A
FILL r8

; Clear text buffer to spaces
LDI r20, BUF
LDI r7, 32
clear_buf_init:
    STORE r20, r7
    ADD r20, r4
    CMPI r20, BUF_END
    BLT r8, clear_buf_init

; Cursor + blink + handle + ansi_state init
LDI r20, CUR_COL
LDI r8, 0
STORE r20, r8
LDI r20, CUR_ROW
STORE r20, r8
LDI r20, SAVED_ROW
STORE r20, r8
LDI r20, SAVED_COL
STORE r20, r8
LDI r20, SAVED_FG
LDI r8, 0xBBBBBB
STORE r20, r8
LDI r20, BLINK
LDI r8, 0
STORE r20, r8
LDI r20, PTY_HANDLE
LDI r8, 0xFFFF
STORE r20, r8
LDI r20, ANSI_STATE
LDI r8, 0
STORE r20, r8
LDI r20, STATUS_CONNECTED
STORE r20, r8
LDI r20, STATUS_CWD_LEN
STORE r20, r8
LDI r20, OSC_LEN
STORE r20, r8
LDI r20, SCROLL_X
STORE r20, r8

; FG_COLOR init (default light gray)
LDI r20, FG_COLOR
LDI r8, 0xBBBBBB
STORE r20, r8

; CSI_PARAM init
LDI r20, CSI_PARAM
LDI r8, 0
STORE r20, r8

; CSI_PARAM2 init
LDI r20, CSI_PARAM2
LDI r8, 0
STORE r20, r8

; SGR_EXTENDED init
LDI r20, SGR_EXTENDED
LDI r8, 0
STORE r20, r8

; DIRTY_STATUS init (start dirty so first frame draws)
LDI r20, DIRTY_STATUS
LDI r8, 1
STORE r20, r8

; DIRTY_ROWS init (start all dirty so first frame draws everything)
LDI r20, DIRTY_ROWS
LDI r8, 0xFFFFFFFF
STORE r20, r8

; SCROLL_TOP/BOT init (default: full screen scroll region)
LDI r20, SCROLL_TOP
LDI r8, 0
STORE r20, r8
LDI r20, SCROLL_BOT
LDI r8, ROWS
SUB r8, r4         ; ROWS - 1
STORE r20, r8

; RENDERED_ROWS init (debug perf counter)
LDI r20, RENDERED_ROWS
LDI r8, 0
STORE r20, r8

; TAB_STOPS init -- default every-8 columns (0, 8, 16, 24, 32, 40, 48, 56, 64, 72)
; 3 u32 words: word0=cols 0-31, word1=cols 32-63, word2=cols 64-79
; Each 8-column boundary sets bit at position col%32 in the appropriate word
; Pattern: 0x01010101 (bits 0,8,16,24 set)
LDI r20, TAB_STOPS
LDI r7, 0x01010101
STORE r20, r7
ADD r20, r4
STORE r20, r7
ADD r20, r4
STORE r20, r7       ; word2 (cols 64-79): only bits 0,8 used (cols 64,72)

; Clear COLOR_BUF to default FG color
LDI r20, COLOR_BUF
LDI r7, 0xBBBBBB
clr_color_init:
    STORE r20, r7
    ADD r20, r4
    CMPI r20, COLOR_END
    BLT r8, clr_color_init

; Title bar background
LDI r4, 0
LDI r5, 0
LDI r1, 256
LDI r10, 10
LDI r0, 0x1A1A2E
RECTF r4, r5, r1, r10, r0

; Title text (using SMALLTEXT for compact display)
LDI r20, SCRATCH
STRO r20, "shell 80x30"
LDI r4, 2
LDI r5, 2
LDI r1, SCRATCH
LDI r10, 0x44DD44
LDI r0, 0x1A1A2E
SMALLTEXT r4, r5, r1, r10, r0

; Close button hit region
LDI r4, 230
LDI r5, 0
LDI r1, 26
LDI r10, 10
HITSET r4, r5, r1, r10, 99

; Empty cmd string for PTYOPEN
LDI r4, CMD_BUF
LDI r8, 0
STORE r4, r8

; PTYOPEN
LDI r0, CMD_BUF
PTYOPEN r0, r9

; Save handle and mark connected
LDI r20, PTY_HANDLE
STORE r20, r9
LDI r28, 0
ADD r28, r9
LDI r20, STATUS_CONNECTED
LDI r8, 1
STORE r20, r8

; PTYSIZE -- tell the PTY we want 80 cols x 30 rows
LDI r9, 30
LDI r2, 80
PTYSIZE r28, r9, r2

; r4 = 1 (restore)
LDI r4, 1

; =========================================
; STARTUP DRAIN (unified)
; =========================================
LDI r20, SEND_BUF
STRO r20, "[connecting...]"
CALL write_str_to_buf
CALL render
FRAME

; r21 = got_output flag
; r22 = frame counter
; r23 = phase (0=drain, 1=probing, 2=probe_drain)
LDI r21, 0
LDI r22, 0
LDI r23, 0

startup_drain:
    LDI r7, RECV_BUF
    LDI r15, 512
    PTYREAD r28, r7, r15
    MOV r14, r8
    CMPI r14, 0
    JZ r8, startup_check_phase
    LDI r15, 0xFFFFFFFF
    CMP r14, r15
    JZ r8, pty_closed

    LDI r6, 0
sd_append:
    CMP r6, r14
    BGE r8, sd_after
    LDI r20, RECV_BUF
    ADD r20, r6
    LOAD r0, r20
    CALL process_byte
    ADD r6, r4
    JMP sd_append
sd_after:
    LDI r21, 1

startup_check_phase:
    CALL render
    FRAME
    ADD r22, r4

    ; Phase 0: drain for 60 frames
    CMPI r23, 0
    JNZ r8, sd_phase1
    CMPI r22, 60
    BLT r22, startup_drain
    ; Check if we got output
    CMPI r21, 0
    JNZ r8, startup_done
    ; No output -- enter probe phase
    LDI r23, 1
    LDI r22, 0
    JMP sd_do_probe

sd_phase1:
    ; Phase 1/2: probe + drain for 30 frames
    CMPI r22, 30
    BLT r22, startup_drain
    ; Give up -- proceed anyway
    JMP startup_done

sd_do_probe:
    LDI r20, SEND_BUF
    STRO r20, "[probing...]"
    CALL write_str_to_buf
    CALL render
    FRAME
    LDI r20, SEND_BUF
    STRO r20, "echo ready\n"
    LDI r7, SEND_BUF
    LDI r15, 11
    PTYWRITE r28, r7, r15
    LDI r23, 2
    LDI r22, 0
    JMP startup_drain

startup_done:
    LDI r4, 1

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r4, 1

    ; Drain pty into text buffer
    LDI r7, RECV_BUF
    LDI r15, 512
    PTYREAD r28, r7, r15
    MOV r14, r8
    CMPI r14, 0
    JZ r8, after_drain
    LDI r15, 0xFFFFFFFF
    CMP r14, r15
    JZ r8, pty_closed

    LDI r6, 0
append_loop:
    CMP r6, r14
    BGE r8, after_drain
    LDI r20, RECV_BUF
    ADD r20, r6
    LOAD r0, r20
    CALL process_byte
    ADD r6, r4
    JMP append_loop

pty_closed:
    LDI r20, STATUS_CONNECTED
    LDI r8, 0
    STORE r20, r8
    LDI r20, DIRTY_STATUS
    LDI r8, 1
    STORE r20, r8
    LDI r20, SEND_BUF
    STRO r20, "[pty closed]"
    CALL write_str_to_buf
    JMP after_drain

after_drain:
    LDI r4, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r8, r20
    ADD r8, r4
    STORE r20, r8

    ; Render
    CALL render
    FRAME

    ; Read keystroke
    IKEY r0
    JZ r0, main_loop

    ; Translate key and send to PTY
    CALL translate_key
    CMPI r8, 0
    JZ r8, main_loop

    ; Send bytes from SEND_BUF
    LDI r7, SEND_BUF
    PTYWRITE r28, r7, r8
    JMP main_loop

; =========================================
; PROCESS_BYTE -- ANSI state machine
; r0 = byte from PTY
; =========================================
process_byte:
    PUSH r31
    LDI r4, 1

    LDI r20, ANSI_STATE
    LOAD r10, r20

    CMPI r10, ANS_NORMAL
    JNZ r8, pb_check_esc

    CMPI r0, 27
    JNZ r8, pb_normal_byte

    LDI r20, ANSI_STATE
    LDI r8, ANS_ESC
    STORE r20, r8
    JMP pb_ret

pb_normal_byte:
    ; Check for UTF-8 multi-byte start
    CMPI r0, 192
    BLT r8, pb_ascii
    CMPI r0, 224
    BGE r8, pb_utf8_3_start

    ; 2-byte UTF-8 (0xC0-0xDF): cp = (r0 & 0x1F) << 6
    LDI r15, 31
    AND r0, r15
    LDI r15, 6
    SHL r0, r15
    LDI r20, UTF8_CP
    STORE r20, r0
    LDI r20, ANSI_STATE
    LDI r8, ANS_UTF8_2
    STORE r20, r8
    JMP pb_ret

pb_utf8_3_start:
    CMPI r0, 240
    BGE r8, pb_ret
    ; 3-byte UTF-8 (0xE0-0xEF): cp = (r0 & 0x0F) << 12
    LDI r15, 15
    AND r0, r15
    LDI r15, 12
    SHL r0, r15
    LDI r20, UTF8_CP
    STORE r20, r0
    LDI r20, ANSI_STATE
    LDI r8, ANS_UTF8_3A
    STORE r20, r8
    JMP pb_ret

pb_ascii:
    CALL append_byte
    JMP pb_ret

pb_check_esc:
    CMPI r10, ANS_ESC
    JNZ r8, pb_check_csi

    CMPI r0, 91
    JNZ r8, pb_esc_check_osc

    LDI r20, ANSI_STATE
    LDI r8, ANS_CSI
    STORE r20, r8
    ; Reset extended SGR state for new sequence
    LDI r20, SGR_EXTENDED
    LDI r8, 0
    STORE r20, r8
    ; Reset CSI params so stale values from previous sequences don't leak
    LDI r20, CSI_PARAM
    LDI r8, 0
    STORE r20, r8
    LDI r20, CSI_PARAM2
    LDI r8, 0
    STORE r20, r8
    JMP pb_ret

pb_esc_check_osc:
    CMPI r0, 93
    JNZ r8, pb_esc_save_cursor

    LDI r20, ANSI_STATE
    LDI r8, ANS_OSC
    STORE r20, r8
    JMP pb_ret

pb_esc_save_cursor:
    CMPI r0, 55 ; '7' = DEC Save Cursor
    JNZ r8, pb_esc_restore_cursor
    CALL save_cursor
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_esc_restore_cursor:
    CMPI r0, 56 ; '8' = DEC Restore Cursor
    JNZ r8, pb_esc_index
    CALL restore_cursor
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_esc_index:
    CMPI r0, 68 ; 'D' = Index (move down, scroll if at bottom)
    JNZ r8, pb_esc_rev_index
    CALL do_newline
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_esc_rev_index:
    CMPI r0, 77 ; 'M' = Reverse Index (move up, scroll if at top)
    JNZ r8, pb_esc_ris
    CALL do_reverse_index
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_esc_ris:
    ; 'c' (99) = RIS (Reset to Initial State)
    CMPI r0, 99
    JNZ r8, pb_esc_hts
    ; Reset cursor to (0,0)
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    LDI r20, CUR_ROW
    STORE r20, r8
    ; Reset saved cursor
    LDI r20, SAVED_ROW
    STORE r20, r8
    LDI r20, SAVED_COL
    STORE r20, r8
    LDI r20, SAVED_FG
    LDI r8, 0xBBBBBB
    STORE r20, r8
    ; Reset FG_COLOR to default
    LDI r20, FG_COLOR
    STORE r20, r8
    ; Reset scroll region to full screen
    LDI r20, SCROLL_TOP
    LDI r8, 0
    STORE r20, r8
    LDI r20, SCROLL_BOT
    LDI r8, ROWS
    LDI r15, 1
    SUB r8, r15
    STORE r20, r8
    ; Reset SGR extended state
    LDI r20, SGR_EXTENDED
    LDI r8, 0
    STORE r20, r8
    ; Clear text buffer
    LDI r20, BUF
    LDI r7, 32
ris_clear_buf:
    STORE r20, r7
    ADD r20, r15
    CMPI r20, BUF_END
    BLT r8, ris_clear_buf
    ; Clear color buffer to default FG
    LDI r20, COLOR_BUF
    LDI r7, 0xBBBBBB
ris_clear_color:
    STORE r20, r7
    ADD r20, r15
    CMPI r20, COLOR_END
    BLT r8, ris_clear_color
    ; Return to normal state
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_esc_hts:
    ; 'H' (72) = HTS (Horizontal Tabulation Set)
    CMPI r0, 72
    JNZ r8, pb_esc_next_line
    ; Set tab stop at current column
    CALL set_tab_stop
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_esc_next_line:
    CMPI r0, 69 ; 'E' = Next Line (CR + Index)
    JNZ r8, pb_esc_other
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    CALL do_newline
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_esc_other:
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_check_csi:
    CMPI r10, ANS_CSI
    JNZ r8, pb_check_osc

    ; Check if this is a final byte (>= 0x40)
    CMPI r0, 64
    BLT r8, pb_csi_param

    ; Final byte arrived -- dispatch based on letter
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    ; Save private mode flag before clearing (handlers need it)
    LDI r20, CSI_PRIVATE
    LOAD r24, r20
    LDI r8, 0
    STORE r20, r8

    ; 'm' (109) = SGR color
    CMPI r0, 109
    JNZ r8, pb_csi_k
    CALL apply_sgr
    JMP pb_ret

pb_csi_k:
    ; 'K' (75) = erase in line
    CMPI r0, 75
    JNZ r8, pb_csi_j
    CALL csi_erase_line
    JMP pb_ret

pb_csi_j:
    ; 'J' (74) = erase in display
    CMPI r0, 74
    JNZ r8, pb_csi_h
    CALL csi_erase_display
    JMP pb_ret

pb_csi_h:
    ; 'H' (72) = cursor position (CSI_PARAM2=row, CSI_PARAM=col)
    CMPI r0, 72
    JNZ r8, pb_csi_a
    CALL csi_cursor_position
    JMP pb_ret

pb_csi_a:
    ; 'A' (65) = cursor up
    CMPI r0, 65
    JNZ r8, pb_csi_b
    CALL csi_cursor_up
    JMP pb_ret

pb_csi_b:
    ; 'B' (66) = cursor down
    CMPI r0, 66
    JNZ r8, pb_csi_c
    CALL csi_cursor_down
    JMP pb_ret

pb_csi_c:
    ; 'C' (67) = cursor right
    CMPI r0, 67
    JNZ r8, pb_csi_d
    CALL csi_cursor_right
    JMP pb_ret

pb_csi_d:
    ; 'D' (68) = cursor left
    CMPI r0, 68
    JNZ r8, pb_csi_e
    CALL csi_cursor_left
    JMP pb_ret

pb_csi_e:
    ; 'E' (69) = cursor next line (CNL) -- move N lines down, col=0
    CMPI r0, 69
    JNZ r8, pb_csi_f
    CALL csi_cursor_next_line
    JMP pb_ret

pb_csi_f:
    ; 'F' (70) = cursor previous line (CPL) -- move N lines up, col=0
    CMPI r0, 70
    JNZ r8, pb_csi_g
    CALL csi_cursor_prev_line
    JMP pb_ret

pb_csi_g:
    ; 'G' (71) = cursor horizontal absolute (CHA)
    CMPI r0, 71
    JNZ r8, pb_csi_f_pos
    CALL csi_cursor_habsolute
    JMP pb_ret

pb_csi_f_pos:
    ; 'f' (102) = horizontal and vertical position (same as H)
    CMPI r0, 102
    JNZ r8, pb_csi_d_lower
    CALL csi_cursor_position
    JMP pb_ret

pb_csi_d_lower:
    ; 'd' (100) = cursor vertical absolute (VPA)
    CMPI r0, 100
    JNZ r8, pb_csi_l
    CALL csi_cursor_vabsolute
    JMP pb_ret

pb_csi_l:
    ; 'L' (76) = insert lines
    CMPI r0, 76
    JNZ r8, pb_csi_m
    CALL csi_insert_lines
    JMP pb_ret

pb_csi_m:
    ; 'M' (77) = delete lines
    CMPI r0, 77
    JNZ r8, pb_csi_p
    CALL csi_delete_lines
    JMP pb_ret

pb_csi_p:
    ; 'P' (80) = delete characters
    CMPI r0, 80
    JNZ r8, pb_csi_at
    CALL csi_delete_chars
    JMP pb_ret

pb_csi_at:
    ; '@' (64) = insert characters (ICH)
    CMPI r0, 64
    JNZ r8, pb_csi_s_up
    CALL csi_insert_chars
    JMP pb_ret

pb_csi_s_up:
    ; 'S' (83) = scroll up N lines
    CMPI r0, 83
    JNZ r8, pb_csi_t_down
    CALL csi_scroll_up
    JMP pb_ret

pb_csi_t_down:
    ; 'T' (84) = scroll down N lines
    CMPI r0, 84
    JNZ r8, pb_csi_r
    CALL csi_scroll_down
    JMP pb_ret

pb_csi_r:
    ; 'r' (114) = set scrolling region (DECSTBM)
    CMPI r0, 114
    JNZ r8, pb_csi_g_tab
    CALL csi_set_scroll_region
    JMP pb_ret

pb_csi_g_tab:
    ; 'g' (103) = tab stop clear (TBC)
    CMPI r0, 103
    JNZ r8, pb_csi_h_mode
    ; TBC: CSI_PARAM determines mode (default 0)
    LDI r20, CSI_PARAM
    LOAD r8, r20
    CMPI r8, 3
    JZ r8, tbc_clear_all
    CMPI r8, 0
    JZ r8, tbc_clear_one
    JMP pb_ret        ; unsupported mode, ignore

tbc_clear_one:
    CALL clear_tab_at_cursor
    JMP pb_ret

tbc_clear_all:
    CALL reset_tab_stops
    JMP pb_ret

pb_csi_h_mode:
    ; 'h' (104) = set mode (private: ?1049h = alt screen on)
    CMPI r0, 104
    JNZ r8, pb_csi_l_mode
    CMPI r24, 0
    JZ r8, pb_ret         ; ignore non-private 'h'
    LDI r20, CSI_PARAM
    LOAD r8, r20
    CMPI r8, 1049
    JNZ r8, pb_ret        ; only handle 1049
    CALL alt_screen_on
    JMP pb_ret

pb_csi_l_mode:
    ; 'l' (108) = reset mode (private: ?1049l = alt screen off)
    CMPI r0, 108
    JNZ r8, pb_csi_s
    CMPI r24, 0
    JZ r8, pb_ret         ; ignore non-private 'l'
    LDI r20, CSI_PARAM
    LOAD r8, r20
    CMPI r8, 1049
    JNZ r8, pb_ret        ; only handle 1049
    CALL alt_screen_off
    JMP pb_ret

pb_csi_s:
    ; 's' (115) = save cursor
    CMPI r0, 115
    JNZ r8, pb_csi_u
    CALL save_cursor
    JMP pb_ret

pb_csi_u:
    ; 'u' (117) = restore cursor
    CMPI r0, 117
    JNZ r8, pb_csi_unknown
    CALL restore_cursor
    JMP pb_ret

pb_csi_unknown:
    ; Unknown CSI final byte -- ignore
    JMP pb_ret

pb_csi_param:
    ; '?' (63) = private mode prefix
    CMPI r0, 63
    JNZ r8, pb_csi_digit
    LDI r20, CSI_PRIVATE
    LDI r8, 1
    STORE r20, r8
    JMP pb_ret

pb_csi_digit:
    ; Check for digit (0x30-0x39)
    CMPI r0, 48
    BLT r8, pb_csi_semi
    CMPI r0, 58
    BGE r8, pb_csi_semi

    ; Accumulate digit: CSI_PARAM = CSI_PARAM * 10 + (r0 - 48)
    LDI r20, CSI_PARAM
    LOAD r8, r20
    LDI r7, 10
    MUL r8, r7
    LDI r7, 48
    SUB r0, r7
    ADD r8, r0
    STORE r20, r8
    JMP pb_ret

pb_csi_semi:
    ; Semicolon (0x3B)
    ; For SGR: apply current param (so multi-color like ESC[1;32m works)
    ; For cursor: save param for later (CSI_PARAM2 = row before ';')
    CMPI r0, 59
    JNZ r8, pb_ret

    ; Save CSI_PARAM to CSI_PARAM2 for cursor sequences
    LDI r20, CSI_PARAM
    LOAD r8, r20
    LDI r15, CSI_PARAM2
    STORE r15, r8

    ; Also apply as SGR (harmless for non-SGR sequences)
    CALL apply_sgr

    ; Reset CSI_PARAM for next digit
    LDI r20, CSI_PARAM
    LDI r8, 0
    STORE r20, r8
    JMP pb_ret

pb_check_osc:
    CMPI r10, ANS_OSC
    JNZ r8, pb_check_utf8_2

    CMPI r0, 7
    JZ r8, pb_osc_end
    CMPI r0, 27
    JNZ r8, pb_osc_continue
    LDI r20, ANSI_STATE
    LDI r8, ANS_ESC
    STORE r20, r8
    JMP pb_ret

pb_osc_continue:
    LDI r20, OSC_LEN
    LOAD r8, r20
    LDI r15, 80
    CMP r8, r15
    BGE r8, pb_ret
    LDI r15, OSC_BUF
    ADD r15, r8
    STORE r15, r0
    ADD r8, r4
    STORE r20, r8
    JMP pb_ret

pb_osc_end:
    CALL process_osc
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_check_utf8_2:
    CMPI r10, ANS_UTF8_2
    JNZ r8, pb_check_utf8_3a

    ; Validate continuation byte (0x80-0xBF)
    CMPI r0, 128
    BLT r8, pb_reset_state
    CMPI r0, 192
    BGE r8, pb_reset_state

    ; cp |= (r0 & 0x3F)
    LDI r15, 63
    AND r0, r15
    LDI r20, UTF8_CP
    LOAD r8, r20
    OR r8, r0
    STORE r20, r8

    ; Map codepoint to extended font index and append
    CALL map_codepoint
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_check_utf8_3a:
    CMPI r10, ANS_UTF8_3A
    JNZ r8, pb_check_utf8_3b

    ; Validate continuation byte
    CMPI r0, 128
    BLT r8, pb_reset_state
    CMPI r0, 192
    BGE r8, pb_reset_state

    ; cp |= (r0 & 0x3F) << 6
    LDI r15, 63
    AND r0, r15
    LDI r15, 6
    SHL r0, r15
    LDI r20, UTF8_CP
    LOAD r8, r20
    OR r8, r0
    STORE r20, r8

    LDI r20, ANSI_STATE
    LDI r8, ANS_UTF8_3B
    STORE r20, r8
    JMP pb_ret

pb_check_utf8_3b:
    CMPI r10, ANS_UTF8_3B
    JNZ r8, pb_reset_state

    ; Validate continuation byte
    CMPI r0, 128
    BLT r8, pb_reset_state
    CMPI r0, 192
    BGE r8, pb_reset_state

    ; cp |= (r0 & 0x3F)
    LDI r15, 63
    AND r0, r15
    LDI r20, UTF8_CP
    LOAD r8, r20
    OR r8, r0
    STORE r20, r8

    ; Map codepoint to extended font index and append
    CALL map_codepoint
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8
    JMP pb_ret

pb_reset_state:
    LDI r20, ANSI_STATE
    LDI r8, ANS_NORMAL
    STORE r20, r8

pb_ret:
    POP r31
    RET

; =========================================
; DIRTY ROW HELPERS
; =========================================
; mark_row_dirty -- mark row in r8 as dirty
; Sets bit (31 - row) in DIRTY_ROWS bitmap
mark_row_dirty:
    PUSH r4
    LDI r4, 31
    SUB r4, r8          ; r4 = 31 - row
    LDI r5, 1
    SHL r5, r4          ; r5 = 1 << (31 - row)
    LDI r1, DIRTY_ROWS
    LOAD r10, r1         ; r10 = current bitmap
    OR r10, r5           ; set the bit
    STORE r1, r10
    POP r4
    RET

; mark_all_dirty -- mark all 30 rows as dirty
mark_all_dirty:
    LDI r4, DIRTY_ROWS
    LDI r8, 0xFFFFFFFF
    STORE r4, r8
    RET

; mark_row_dirty_check -- check if row in r8 is dirty
; Returns r8 = bit value (0=clean, nonzero=dirty)
mark_row_dirty_check:
    PUSH r31
    LDI r4, 31
    SUB r4, r8          ; r4 = 31 - row
    LDI r5, 1
    SHL r5, r4          ; r5 = 1 << (31 - row)
    LDI r1, DIRTY_ROWS
    LOAD r10, r1         ; r10 = current bitmap
    MOV r8, r10
    AND r8, r5          ; r8 = bitmap & mask
    POP r31
    RET

; =========================================
; APPEND_BYTE -- append r0 to text buffer
; =========================================
append_byte:
    PUSH r31
    LDI r4, 1

    CMPI r0, 10
    JNZ r8, ab_check_cr
    CALL do_newline
    JMP ab_ret

ab_check_cr:
    CMPI r0, 13
    JNZ r8, ab_check_tab
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    JMP ab_ret

ab_check_tab:
    CMPI r0, 9
    JNZ r8, ab_check_print
    CALL advance_to_tab
    JMP ab_ret

ab_check_print:
    CMPI r0, 32
    BLT r8, ab_ret
    ; Accept 32-126 (ASCII printable)
    CMPI r0, 127
    BLT r8, ab_store
    ; Reject 127 (DEL)
    CMPI r0, 127
    JZ r8, ab_ret
    ; Accept 128-157 (extended box-drawing)
    CMPI r0, 158
    BGE r8, ab_ret

ab_store:
    ; buf[row*COLS + col] = r0
    LDI r20, CUR_ROW
    LOAD r5, r20
    LDI r1, COLS
    MUL r5, r1
    LDI r20, CUR_COL
    LOAD r8, r20
    ADD r5, r8
    LDI r20, BUF
    ADD r20, r5
    STORE r20, r0

    ; color_buf[row*COLS + col] = FG_COLOR
    LDI r20, COLOR_BUF
    ADD r20, r5
    LDI r7, FG_COLOR
    LOAD r7, r7
    STORE r20, r7

    ; col++
    LDI r20, CUR_COL
    LOAD r8, r20
    ADD r8, r4
    STORE r20, r8
    CMPI r8, COLS
    JNZ r8, ab_mark_dirty
    CALL do_newline

ab_mark_dirty:
    ; Mark current row as dirty for rendering
    LDI r20, CUR_ROW
    LOAD r8, r20
    CALL mark_row_dirty

ab_ret:
    POP r31
    RET

; =========================================
; MAP_CODEPOINT -- map Unicode codepoint to extended font byte
; Reads UTF8_CP, maps to 128-157 range, calls append_byte
; Unknown codepoints render as '?' (63)
; CJK full-width (0x3000-0x9FFF) rendered as full block (148)
; =========================================
map_codepoint:
    PUSH r31
    LDI r4, 1

    LDI r20, UTF8_CP
    LOAD r0, r20

    ; Box drawing U+2500-U+257F
    CMPI r0, 9472
    BLT r8, mc_check_arrows
    CMPI r0, 9600
    BGE r8, mc_check_blocks

    ; Map U+2500-257F to 128+
    ; 0x2500 = 9472, 128 + (cp - 9472) but only for known chars
    LDI r15, 9472
    SUB r0, r15
    ; r0 = offset from U+2500

    ; U+2500 (0) = 128 (horiz)
    CMPI r0, 0
    JNZ r8, mc_2502
    LDI r0, 128
    CALL append_byte
    JMP mc_ret

mc_2502:
    CMPI r0, 2
    JNZ r8, mc_250c
    LDI r0, 129
    CALL append_byte
    JMP mc_ret

mc_250c:
    CMPI r0, 12
    JNZ r8, mc_2510
    LDI r0, 130
    CALL append_byte
    JMP mc_ret

mc_2510:
    CMPI r0, 16
    JNZ r8, mc_2514
    LDI r0, 131
    CALL append_byte
    JMP mc_ret

mc_2514:
    CMPI r0, 20
    JNZ r8, mc_2518
    LDI r0, 132
    CALL append_byte
    JMP mc_ret

mc_2518:
    CMPI r0, 24
    JNZ r8, mc_251c
    LDI r0, 133
    CALL append_byte
    JMP mc_ret

mc_251c:
    CMPI r0, 28
    JNZ r8, mc_2524
    LDI r0, 134
    CALL append_byte
    JMP mc_ret

mc_2524:
    CMPI r0, 36
    JNZ r8, mc_252c
    LDI r0, 135
    CALL append_byte
    JMP mc_ret

mc_252c:
    CMPI r0, 44
    JNZ r8, mc_2534
    LDI r0, 136
    CALL append_byte
    JMP mc_ret

mc_2534:
    CMPI r0, 52
    JNZ r8, mc_253c
    LDI r0, 137
    CALL append_byte
    JMP mc_ret

mc_253c:
    CMPI r0, 60
    JNZ r8, mc_2550
    LDI r0, 138
    CALL append_byte
    JMP mc_ret

mc_2550:
    ; U+2550 = 9552, offset = 80
    CMPI r0, 80
    JNZ r8, mc_2551
    LDI r0, 155
    CALL append_byte
    JMP mc_ret

mc_2551:
    CMPI r0, 81
    JNZ r8, mc_box_unknown
    LDI r0, 156
    CALL append_byte
    JMP mc_ret

mc_box_unknown:
    ; Unknown box-drawing char, render as '?'
    LDI r0, 63
    CALL append_byte
    JMP mc_ret

mc_check_arrows:
    ; U+2190-U+2193 (arrows)
    CMPI r0, 8592
    JNZ r8, mc_check_sym
    LDI r0, 139
    CALL append_byte
    JMP mc_ret

mc_check_sym:
    CMPI r0, 8594
    JNZ r8, mc_check_up
    LDI r0, 140
    CALL append_byte
    JMP mc_ret

mc_check_up:
    CMPI r0, 8593
    JNZ r8, mc_check_down
    LDI r0, 141
    CALL append_byte
    JMP mc_ret

mc_check_down:
    CMPI r0, 8595
    JNZ r8, mc_check_sym2
    LDI r0, 142
    CALL append_byte
    JMP mc_ret

mc_check_sym2:
    ; U+2713 (check) = 10003
    CMPI r0, 10003
    JNZ r8, mc_check_sym3
    LDI r0, 143
    CALL append_byte
    JMP mc_ret

mc_check_sym3:
    ; U+2717 (ballot X) = 10007
    CMPI r0, 10007
    JNZ r8, mc_check_bullet
    LDI r0, 144
    CALL append_byte
    JMP mc_ret

mc_check_bullet:
    ; U+2022 (bullet) = 8226
    CMPI r0, 8226
    JNZ r8, mc_check_middot
    LDI r0, 145
    CALL append_byte
    JMP mc_ret

mc_check_middot:
    ; U+00B7 (middot) = 183
    CMPI r0, 183
    JNZ r8, mc_check_ellipsis
    LDI r0, 146
    CALL append_byte
    JMP mc_ret

mc_check_ellipsis:
    ; U+2026 (ellipsis) = 8230
    CMPI r0, 8230
    JNZ r8, mc_check_raquo
    LDI r0, 147
    CALL append_byte
    JMP mc_ret

mc_check_raquo:
    ; U+00BB (right double angle) = 187
    CMPI r0, 187
    JNZ r8, mc_check_cjk
    LDI r0, 157
    CALL append_byte
    JMP mc_ret

mc_check_blocks:
    ; Block elements U+2580-U+259F
    CMPI r0, 9600
    BLT r8, mc_unknown
    CMPI r0, 9632
    BGE r8, mc_check_cjk

    LDI r15, 9600
    SUB r0, r15
    ; U+2580 (0) = 151 (upper half)
    CMPI r0, 0
    JNZ r8, mc_2584
    LDI r0, 151
    CALL append_byte
    JMP mc_ret

mc_2584:
    CMPI r0, 4
    JNZ r8, mc_2588
    LDI r0, 152
    CALL append_byte
    JMP mc_ret

mc_2588:
    CMPI r0, 8
    JNZ r8, mc_258c
    LDI r0, 148
    CALL append_byte
    JMP mc_ret

mc_258c:
    CMPI r0, 12
    JNZ r8, mc_258e
    LDI r0, 149
    CALL append_byte
    JMP mc_ret

mc_258e:
    CMPI r0, 14
    JNZ r8, mc_2590
    LDI r0, 153
    CALL append_byte
    JMP mc_ret

mc_2590:
    CMPI r0, 16
    JNZ r8, mc_258a
    LDI r0, 150
    CALL append_byte
    JMP mc_ret

mc_258a:
    CMPI r0, 10
    JNZ r8, mc_block_unknown
    LDI r0, 154
    CALL append_byte
    JMP mc_ret

mc_block_unknown:
    LDI r0, 148
    CALL append_byte
    JMP mc_ret

mc_check_cjk:
    ; CJK Unified Ideographs U+3000-U+9FFF -- render as double-width full block
    CMPI r0, 12288
    BLT r8, mc_unknown
    CMPI r0, 40960
    BGE r8, mc_unknown

    ; Full-width char: insert full block, advance col by 2
    LDI r0, 148
    CALL append_byte
    CALL append_byte
    JMP mc_ret

mc_unknown:
    ; Unknown codepoint, render as '?'
    LDI r0, 63
    CALL append_byte

mc_ret:
    POP r31
    RET

; =========================================
; TRANSLATE_KEY
; =========================================
translate_key:
    PUSH r31
    LDI r4, 1

    CMPI r0, 32
    BLT r8, tk_special
    CMPI r0, 127
    BGE r8, tk_special
    LDI r20, SEND_BUF
    STORE r20, r0
    LDI r8, 1
    JMP tk_ret

tk_special:
    CMPI r0, 13
    JNZ r8, tk_bs
    LDI r20, SEND_BUF
    LDI r8, 10
    STORE r20, r8
    LDI r8, 1
    JMP tk_ret

tk_bs:
    CMPI r0, 8
    JNZ r8, tk_del
    LDI r20, SEND_BUF
    LDI r8, 127
    STORE r20, r8
    LDI r8, 1
    JMP tk_ret

tk_del:
    CMPI r0, 127
    JNZ r8, tk_tab
    LDI r20, SEND_BUF
    LDI r8, 127
    STORE r20, r8
    LDI r8, 1
    JMP tk_ret

tk_tab:
    CMPI r0, 9
    JNZ r8, tk_ctrl_c
    LDI r20, SEND_BUF
    LDI r8, 9
    STORE r20, r8
    LDI r8, 1
    JMP tk_ret

tk_ctrl_c:
    CMPI r0, 3
    JNZ r8, tk_ctrl_d
    LDI r20, SEND_BUF
    LDI r8, 3
    STORE r20, r8
    LDI r8, 1
    JMP tk_ret

tk_ctrl_d:
    CMPI r0, 4
    JNZ r8, tk_escape
    LDI r20, SEND_BUF
    LDI r8, 4
    STORE r20, r8
    LDI r8, 1
    JMP tk_ret

tk_escape:
    CMPI r0, 27
    JNZ r8, tk_arrow_up
    LDI r20, SEND_BUF
    LDI r8, 27
    STORE r20, r8
    LDI r8, 1
    JMP tk_ret

tk_arrow_up:
    CMPI r0, KEY_UP
    JNZ r8, tk_arrow_down
    LDI r20, SEND_BUF
    LDI r8, 27
    STORE r20, r8
    LDI r20, SEND_BUF
    ADD r20, r4
    LDI r8, 91
    STORE r20, r8
    LDI r20, SEND_BUF
    LDI r5, 2
    ADD r20, r5
    LDI r8, 65
    STORE r20, r8
    LDI r8, 3
    JMP tk_ret

tk_arrow_down:
    CMPI r0, KEY_DOWN
    JNZ r8, tk_arrow_right
    LDI r20, SEND_BUF
    LDI r8, 27
    STORE r20, r8
    LDI r20, SEND_BUF
    ADD r20, r4
    LDI r8, 91
    STORE r20, r8
    LDI r20, SEND_BUF
    LDI r5, 2
    ADD r20, r5
    LDI r8, 66
    STORE r20, r8
    LDI r8, 3
    JMP tk_ret

tk_arrow_right:
    CMPI r0, KEY_RIGHT
    JNZ r8, tk_arrow_left
    LDI r20, SEND_BUF
    LDI r8, 27
    STORE r20, r8
    LDI r20, SEND_BUF
    ADD r20, r4
    LDI r8, 91
    STORE r20, r8
    LDI r20, SEND_BUF
    LDI r5, 2
    ADD r20, r5
    LDI r8, 67
    STORE r20, r8
    LDI r8, 3
    JMP tk_ret

tk_arrow_left:
    CMPI r0, KEY_LEFT
    JNZ r8, tk_home
    LDI r20, SEND_BUF
    LDI r8, 27
    STORE r20, r8
    LDI r20, SEND_BUF
    ADD r20, r4
    LDI r8, 91
    STORE r20, r8
    LDI r20, SEND_BUF
    LDI r5, 2
    ADD r20, r5
    LDI r8, 68
    STORE r20, r8
    LDI r8, 3
    JMP tk_ret

tk_home:
    CMPI r0, KEY_HOME
    JNZ r8, tk_end
    LDI r20, SEND_BUF
    LDI r8, 27
    STORE r20, r8
    LDI r20, SEND_BUF
    ADD r20, r4
    LDI r8, 91
    STORE r20, r8
    LDI r20, SEND_BUF
    LDI r5, 2
    ADD r20, r5
    LDI r8, 72
    STORE r20, r8
    LDI r8, 3
    JMP tk_ret

tk_end:
    CMPI r0, KEY_END
    JNZ r8, tk_ignore
    LDI r20, SEND_BUF
    LDI r8, 27
    STORE r20, r8
    LDI r20, SEND_BUF
    ADD r20, r4
    LDI r8, 91
    STORE r20, r8
    LDI r20, SEND_BUF
    LDI r5, 2
    ADD r20, r5
    LDI r8, 70
    STORE r20, r8
    LDI r8, 3
    JMP tk_ret

tk_ignore:
    LDI r8, 0

tk_ret:
    POP r31
    RET

; =========================================
; DO_NEWLINE -- col=0, row++ or scroll
; =========================================
do_newline:
    PUSH r31
    LDI r4, 1
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    LDI r20, CUR_ROW
    LOAD r7, r20
    ADD r7, r4
    CMPI r7, ROWS
    BLT r8, dn_store
    CALL scroll_up
    LDI r20, CUR_ROW
    LDI r7, 29
dn_store:
    STORE r20, r7
    POP r31
    RET

; =========================================
; SCROLL_UP -- shift rows up, clear last row
; =========================================
scroll_up:
    PUSH r31
    LDI r4, 1
    LDI r2, COLS
    LDI r9, 0
scroll_loop:
    CMPI r9, 29
    BGE r8, scroll_clear

    ; dst = BUF + row * COLS
    LDI r21, BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8

    ; src = BUF + (row+1) * COLS
    LDI r20, BUF
    MOV r8, r9
    ADD r8, r4
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8

    ; MEMCPY dst, src, COLS
    MEMCPY r21, r20, r2

    ; Same for color buffer: dst = COLOR_BUF + row * COLS
    LDI r21, COLOR_BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8

    ; src = COLOR_BUF + (row+1) * COLS
    LDI r20, COLOR_BUF
    MOV r8, r9
    ADD r8, r4
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8

    ; MEMCPY dst, src, COLS
    MEMCPY r21, r20, r2

    ADD r9, r4
    JMP scroll_loop

scroll_clear:
    ; Clear last row of text buffer using MEMCPY from a pre-zeroed region
    ; We use a trick: copy from a region we already cleared (row 0 after scroll is row 1's old data)
    ; Simpler: just use a STORE loop for the fill (MEMCPY can't fill)
    LDI r20, BUF
    LDI r7, 29
    LDI r2, COLS
    MUL r7, r2
    ADD r20, r7
    LDI r7, 32
    LDI r22, 0
sc_loop:
    STORE r20, r7
    ADD r20, r4
    ADD r22, r4
    CMPI r22, COLS
    BLT r8, sc_loop

    ; Clear last row of color buffer with default FG color
    LDI r20, COLOR_BUF
    LDI r7, 29
    LDI r2, COLS
    MUL r7, r2
    ADD r20, r7
    LDI r7, FG_COLOR
    LOAD r7, r7
    LDI r22, 0
sc_color_loop:
    STORE r20, r7
    ADD r20, r4
    ADD r22, r4
    CMPI r22, COLS
    BLT r8, sc_color_loop

    CALL mark_all_dirty
    POP r31
    RET

; =========================================
; DO_REVERSE_INDEX -- move cursor up one line, scroll down if at top
; =========================================
do_reverse_index:
    PUSH r31
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, dri_dec
    ; At top of screen — scroll down (insert blank line at top)
    CALL scroll_down
    JMP dri_ret
dri_dec:
    SUB r7, r4
    STORE r20, r7
dri_ret:
    POP r31
    RET

; =========================================
; SCROLL_DOWN -- shift rows down, clear top row
; =========================================
scroll_down:
    PUSH r31
    LDI r4, 1
    ; Copy rows from bottom to top (iterate 28..0)
    LDI r9, 28
sd_loop:
    CMPI r9, 0
    BLT r8, sd_clear

    ; dst = BUF + (row+1) * COLS
    LDI r21, BUF
    MOV r8, r9
    ADD r8, r4
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8

    ; src = BUF + row * COLS
    LDI r20, BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8

    ; MEMCPY dst, src, COLS
    MEMCPY r21, r20, r2

    ; Same for color buffer
    LDI r21, COLOR_BUF
    MOV r8, r9
    ADD r8, r4
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8

    LDI r20, COLOR_BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8

    MEMCPY r21, r20, r2

    SUB r9, r4
    JMP sd_loop

sd_clear:
    ; Clear top row (row 0) of text buffer
    LDI r20, BUF
    LDI r7, 32
    LDI r22, 0
sd_text_loop:
    STORE r20, r7
    ADD r20, r4
    ADD r22, r4
    CMPI r22, COLS
    BLT r8, sd_text_loop

    ; Clear top row of color buffer with default FG color
    LDI r20, COLOR_BUF
    LDI r7, FG_COLOR
    LOAD r7, r7
    LDI r22, 0
sd_color_loop:
    STORE r20, r7
    ADD r20, r4
    ADD r22, r4
    CMPI r22, COLS
    BLT r8, sd_color_loop

    POP r31
    RET

; =========================================
; TAB STOP SUBROUTINES
; Tab stops stored as 3 u32 words at TAB_STOPS (0x4E19)
; word0 = cols 0-31, word1 = cols 32-63, word2 = cols 64-79
; Bit N set = column N has a tab stop
; Default: every 8 columns (pattern 0x01010101 per word)
; =========================================

; set_tab_stop -- set tab stop at current cursor column
; Clobbers: r8, r4, r5, r1
set_tab_stop:
    PUSH r31
    PUSH r8
    LDI r4, 1
    ; Get current column
    LDI r20, CUR_COL
    LOAD r8, r20
    ; word_index = col / 32
    LDI r5, 32
    LDI r1, 0
sts_div_loop:
    CMPI r8, 32
    BLT r8, sts_div_done
    SUB r8, r5
    ADD r1, r4
    JMP sts_div_loop
sts_div_done:
    ; r1 = word_index, r8 = bit position within word
    PUSH r8              ; save bit position (CMP will clobber r8)
    ; Load the word
    LDI r20, TAB_STOPS
    ADD r20, r1
    LOAD r5, r20
    POP r8               ; restore bit position
    ; Set bit: r5 |= (1 << r8)
    LDI r10, 1
    LDI r0, 0
sts_shift_loop:
    CMP r0, r8
    JZ r8, sts_shift_done
    SHL r10, r4
    ADD r0, r4
    JMP sts_shift_loop
sts_shift_done:
    OR r5, r10
    STORE r20, r5
    POP r8
    POP r31
    RET

; clear_tab_at_cursor -- clear tab stop at current cursor column
; Clobbers: r8, r4, r5, r1
clear_tab_at_cursor:
    PUSH r31
    PUSH r8
    LDI r4, 1
    ; Get current column
    LDI r20, CUR_COL
    LOAD r8, r20
    ; word_index = col / 32
    LDI r5, 32
    LDI r1, 0
ctc_div_loop:
    CMPI r8, 32
    BLT r8, ctc_div_done
    SUB r8, r5
    ADD r1, r4
    JMP ctc_div_loop
ctc_div_done:
    ; r1 = word_index, r8 = bit position within word
    PUSH r8              ; save bit position (CMP will clobber r8)
    LDI r20, TAB_STOPS
    ADD r20, r1
    LOAD r5, r20
    POP r8               ; restore bit position
    ; Clear bit: r5 &= ~(1 << r8)
    LDI r10, 1
    LDI r0, 0
ctc_shift_loop:
    CMP r0, r8
    JZ r8, ctc_shift_done
    SHL r10, r4
    ADD r0, r4
    JMP ctc_shift_loop
ctc_shift_done:
    ; r10 = mask. Invert: r10 = ~r10 (all bits except the one to clear)
    ; Geometry OS uses ! for bitwise NOT
    LDI r7, 0xFFFFFFFF
    XOR r10, r7
    AND r5, r10
    STORE r20, r5
    POP r8
    POP r31
    RET

; reset_tab_stops -- clear all tab stops, reset to default every-8
; Clobbers: r8, r4
reset_tab_stops:
    PUSH r31
    LDI r4, 1
    ; Default pattern: 0x01010101 (bits 0, 8, 16, 24)
    LDI r20, TAB_STOPS
    LDI r8, 0x01010101
    STORE r20, r8
    ADD r20, r4
    STORE r20, r8
    ADD r20, r4
    STORE r20, r8
    POP r31
    RET

; advance_to_tab -- move cursor to next tab stop (for TAB / 0x09)
; If no tab stop found, move to last column (COLS-1)
; Clobbers: r8, r4, r5, r1, r10, r0
advance_to_tab:
    PUSH r31
    PUSH r8
    LDI r4, 1
    ; Start searching from (col + 1)
    LDI r20, CUR_COL
    LOAD r8, r20
    ADD r8, r4

att_scan_loop:
    ; Check if past last column
    CMPI r8, COLS
    BGE r8, att_clamp

    ; Save scan column (CMP in div/shift loops clobbers r8)
    PUSH r8

    ; Compute word_index = col / 32 and bit_pos = col % 32
    ; using repeated subtraction on a copy
    MOV r5, r8           ; r5 = col (will become bit_pos after div)
    LDI r1, 0            ; r1 = word_index
    LDI r15, 32           ; r15 = divisor
att_div_loop:
    CMPI r5, 32
    BLT r8, att_check_bit
    SUB r5, r15           ; r5 -= 32
    ADD r1, r4           ; word_index++
    JMP att_div_loop

att_check_bit:
    ; Load the tab stop word
    LDI r20, TAB_STOPS
    ADD r20, r1
    LOAD r10, r20
    ; Check if bit r5 is set: shift 1 left by r5, AND
    LDI r0, 1
    LDI r7, 0
att_shift_loop:
    CMP r7, r5
    JZ r8, att_test_bit
    SHL r0, r4
    ADD r7, r4
    JMP att_shift_loop
att_test_bit:
    AND r10, r0
    JNZ r10, att_found_pop

    ; Not a tab stop -- restore column and try next
    POP r8               ; restore scan column
att_scan_next:
    ADD r8, r4
    JMP att_scan_loop

att_found_pop:
    POP r8               ; restore scan column (r8 = tab stop column)
att_found:
    ; Found tab stop at column r8 -- move cursor there
    LDI r20, CUR_COL
    STORE r20, r8
    LDI r20, CUR_ROW
    LOAD r8, r20         ; r8 = current row for mark_row_dirty
    CALL mark_row_dirty
    POP r8
    POP r31
    RET

att_clamp:
    ; Move to last column
    LDI r20, CUR_COL
    LDI r8, COLS
    SUB r8, r4
    STORE r20, r8
    LDI r20, CUR_ROW
    LOAD r8, r20         ; r8 = current row for mark_row_dirty
    CALL mark_row_dirty
    POP r31
    RET

; =========================================
; WRITE_STR_TO_BUF
; =========================================
write_str_to_buf:
    PUSH r31
    PUSH r20
    PUSH r25
    MOV r25, r20          ; r25 = string pointer (r20 clobbered by append_byte)
    LDI r4, 1
wsb_loop:
    LOAD r0, r25
    JZ r0, wsb_done
    CALL append_byte
    ADD r25, r4
    JMP wsb_loop
wsb_done:
    POP r25
    POP r20
    POP r31
    RET

; =========================================
; PROCESS_OSC -- handle OSC sequence
; =========================================
process_osc:
    PUSH r31
    LDI r4, 1

    LDI r20, OSC_BUF
    LOAD r8, r20
    CMPI r8, 55
    JNZ r8, po_done

    LDI r20, OSC_BUF
    ADD r20, r4
    LOAD r8, r20
    CMPI r8, 59
    JNZ r8, po_done

    LDI r9, 0
    LDI r2, 0
po_find_path:
    LDI r20, OSC_BUF
    ADD r20, r9
    LOAD r8, r20
    JZ r8, po_done
    CMPI r8, 47
    JNZ r8, po_next
    ADD r2, r4
    CMPI r2, 3
    BGE r8, po_copy_path
po_next:
    ADD r9, r4
    LDI r15, 80
    CMP r9, r15
    BLT r8, po_find_path
    JMP po_done

po_copy_path:
    LDI r12, 0
po_cp_loop:
    LDI r20, OSC_BUF
    ADD r20, r9
    LOAD r8, r20
    JZ r8, po_cp_done
    LDI r15, STATUS_CWD
    ADD r15, r12
    STORE r15, r8
    ADD r9, r4
    ADD r12, r4
    LDI r15, 60
    CMP r12, r15
    BLT r8, po_cp_loop
po_cp_done:
    LDI r15, STATUS_CWD
    ADD r15, r12
    LDI r8, 0
    STORE r15, r8
    LDI r20, STATUS_CWD_LEN
    STORE r20, r12

po_done:
    LDI r20, OSC_LEN
    LDI r8, 0
    STORE r20, r8
    ; Mark status bar dirty (CWD may have changed)
    LDI r20, DIRTY_STATUS
    LDI r8, 1
    STORE r20, r8
    POP r31
    RET

; =========================================
; DRAW_STATUS_BAR
; =========================================
draw_status_bar:
    PUSH r31
    LDI r4, 1

    LDI r4, 0
    LDI r5, 0
    LDI r1, 256
    LDI r10, 10
    LDI r0, 0x1A1A2E
    RECTF r11, r5, r1, r10, r0

    LDI r4, 1
    LDI r20, SCRATCH
    STRO r20, "bash: "
    LDI r20, SCRATCH
    LDI r9, 0
dsb_find_end:
    LDI r15, SCRATCH
    ADD r15, r9
    LOAD r8, r15
    JZ r8, dsb_append_cwd
    ADD r9, r4
    JMP dsb_find_end

dsb_append_cwd:
    LDI r20, STATUS_CWD_LEN
    LOAD r8, r20
    JZ r8, dsb_no_cwd

    LDI r2, 0
dsb_cp:
    LDI r15, STATUS_CWD
    ADD r15, r2
    LOAD r8, r15
    JZ r8, dsb_cp_done
    LDI r15, SCRATCH
    ADD r15, r9
    STORE r15, r8
    ADD r9, r4
    ADD r2, r4
    LDI r15, 38
    CMP r9, r15
    BLT r8, dsb_cp
    JMP dsb_cp_done

dsb_no_cwd:
    LDI r15, SCRATCH
    ADD r15, r9
    LDI r8, 126
    STORE r15, r8
    ADD r9, r4

dsb_cp_done:
    LDI r15, SCRATCH
    ADD r15, r9
    LDI r8, 0
    STORE r15, r8

    LDI r4, 2
    LDI r5, 2
    LDI r1, SCRATCH
    LDI r10, 0x44DD44
    LDI r0, 0x1A1A2E
    SMALLTEXT r4, r5, r1, r10, r0

    LDI r20, STATUS_CONNECTED
    LOAD r8, r20
    JZ r8, dsb_disconnected

    LDI r20, SCRATCH
    LDI r8, 42
    STORE r20, r8
    LDI r8, 0
    ADD r20, r4
    STORE r20, r8
    LDI r4, 240
    LDI r5, 2
    LDI r1, SCRATCH
    LDI r10, 0x44FF44
    LDI r0, 0x1A1A2E
    SMALLTEXT r4, r5, r1, r10, r0
    JMP dsb_ret

dsb_disconnected:
    LDI r20, SCRATCH
    LDI r8, 88
    STORE r20, r8
    LDI r8, 0
    ADD r20, r4
    STORE r20, r8
    LDI r4, 240
    LDI r5, 2
    LDI r1, SCRATCH
    LDI r10, 0xFF4444
    LDI r0, 0x1A1A2E
    SMALLTEXT r4, r5, r1, r10, r0

dsb_ret:
    ; Draw dirty row count ("N/30" at right edge)
    LDI r20, RENDERED_ROWS
    LOAD r20, r20

    ; Divide by 10: r20 = tens, r8 = ones
    PUSH r20
    LDI r21, 10
    DIV r20, r21         ; r20 = count / 10
    POP r8               ; r8 = original count
    LDI r21, 10
    MOD r8, r21          ; r8 = count % 10

    ; Write "tens/30" to SCRATCH
    LDI r19, 48
    ADD r20, r19         ; tens + '0'
    LDI r21, SCRATCH
    STORE r21, r20
    MOV r19, r8
    LDI r8, 48
    ADD r19, r8          ; ones + '0'
    MOV r8, r19
    ADD r21, r4
    STORE r21, r8
    ADD r21, r4
    LDI r8, 47           ; '/'
    STORE r21, r8
    ADD r21, r4
    LDI r8, 51           ; '3'
    STORE r21, r8
    ADD r21, r4
    LDI r8, 48           ; '0'
    STORE r21, r8
    ADD r21, r4
    LDI r8, 0
    STORE r21, r8

    LDI r4, 252
    LDI r5, 2
    LDI r1, SCRATCH
    LDI r10, 0x8888FF
    LDI r0, 0x1A1A2E
    SMALLTEXT r4, r5, r1, r10, r0

    POP r31
    RET

; =========================================
; APPLY_SGR -- apply SGR code from CSI_PARAM to FG_COLOR
; Reads CSI_PARAM from RAM, updates FG_COLOR in RAM.
; Preserves all registers except r8 (CMP clobbers it).
; Supports extended SGR (256-color) via SGR_EXTENDED state.
; =========================================
apply_sgr:
    PUSH r31
    LDI r4, 1

    LDI r20, CSI_PARAM
    LOAD r7, r20       ; r7 = SGR code

    ; ── Extended SGR state machine ──
    LDI r20, SGR_EXTENDED
    LOAD r15, r20       ; r15 = extended state

    ; State 0x85: waiting for 256-color FG index
    CMPI r15, 0x85
    JNZ r8, sgr_ext95
    CALL sgr_256_to_rgb  ; r8 = RGB from r7 (color index)
    LDI r20, FG_COLOR
    STORE r20, r8
    LDI r20, SGR_EXTENDED
    LDI r8, 0
    STORE r20, r8
    JMP sgr_ret

sgr_ext95:
    ; State 0x95: waiting for 256-color BG index (not rendered yet)
    CMPI r15, 0x95
    JNZ r8, sgr_ext38
    ; No BG support in renderer, just consume the index
    LDI r20, SGR_EXTENDED
    LDI r8, 0
    STORE r20, r8
    JMP sgr_ret

sgr_ext38:
    ; State 38: saw "38", waiting for sub-mode (5 or 2)
    CMPI r15, 38
    JNZ r8, sgr_ext48
    CMPI r7, 5
    JNZ r8, sgr_ext38_reset
    ; 38;5 → enter waiting-for-index state (0x85)
    LDI r20, SGR_EXTENDED
    LDI r8, 0x85
    STORE r20, r8
    JMP sgr_ret

sgr_ext38_reset:
    ; 38;2 (24-bit) or unknown sub-mode — reset and fall through
    LDI r20, SGR_EXTENDED
    LDI r8, 0
    STORE r20, r8
    JMP sgr_normal

sgr_ext48:
    ; State 48: saw "48", waiting for sub-mode
    CMPI r15, 48
    JNZ r8, sgr_normal
    CMPI r7, 5
    JNZ r8, sgr_ext48_reset
    ; 48;5 → enter waiting-for-index state (0x95)
    LDI r20, SGR_EXTENDED
    LDI r8, 0x95
    STORE r20, r8
    JMP sgr_ret

sgr_ext48_reset:
    LDI r20, SGR_EXTENDED
    LDI r8, 0
    STORE r20, r8
    ; Fall through to normal dispatch

sgr_normal:
    ; ── Extended SGR entry points ──

    ; Code 38 = extended FG color
    CMPI r7, 38
    JNZ r8, sgr_n48
    LDI r20, SGR_EXTENDED
    LDI r8, 38
    STORE r20, r8
    JMP sgr_ret

sgr_n48:
    ; Code 48 = extended BG color (accept but no renderer support)
    CMPI r7, 48
    JNZ r8, sgr_n39
    LDI r20, SGR_EXTENDED
    LDI r8, 48
    STORE r20, r8
    JMP sgr_ret

sgr_n39:
    ; Code 39 = reset FG to default
    CMPI r7, 39
    JNZ r8, sgr_n49
    LDI r20, FG_COLOR
    LDI r8, 0xBBBBBB
    STORE r20, r8
    JMP sgr_ret

sgr_n49:
    ; Code 49 = reset BG (no-op, no BG support)
    CMPI r7, 49
    JNZ r8, sgr_existing
    JMP sgr_ret

sgr_existing:
    ; ── Standard SGR dispatch (16-color) ──
    ; r7 already loaded with SGR code from above

    ; 0 = reset (default light gray)
    CMPI r7, 0
    JNZ r8, sgr_bold
    LDI r20, FG_COLOR
    LDI r8, 0xBBBBBB
    STORE r20, r8
    JMP sgr_ret

sgr_bold:
    ; 1 = bold (brighten -- just use bright white)
    CMPI r7, 1
    JNZ r8, sgr_black
    LDI r20, FG_COLOR
    LDI r8, 0xFFFFFF
    STORE r20, r8
    JMP sgr_ret

sgr_black:
    ; 30 = black
    CMPI r7, 30
    JNZ r8, sgr_red
    LDI r20, FG_COLOR
    LDI r8, 0x555555
    STORE r20, r8
    JMP sgr_ret

sgr_red:
    CMPI r7, 31
    JNZ r8, sgr_green
    LDI r20, FG_COLOR
    LDI r8, 0xCD0000
    STORE r20, r8
    JMP sgr_ret

sgr_green:
    CMPI r7, 32
    JNZ r8, sgr_yellow
    LDI r20, FG_COLOR
    LDI r8, 0x00CD00
    STORE r20, r8
    JMP sgr_ret

sgr_yellow:
    CMPI r7, 33
    JNZ r8, sgr_blue
    LDI r20, FG_COLOR
    LDI r8, 0xCDCD00
    STORE r20, r8
    JMP sgr_ret

sgr_blue:
    CMPI r7, 34
    JNZ r8, sgr_magenta
    LDI r20, FG_COLOR
    LDI r8, 0x0000EE
    STORE r20, r8
    JMP sgr_ret

sgr_magenta:
    CMPI r7, 35
    JNZ r8, sgr_cyan
    LDI r20, FG_COLOR
    LDI r8, 0xCD00CD
    STORE r20, r8
    JMP sgr_ret

sgr_cyan:
    CMPI r7, 36
    JNZ r8, sgr_white
    LDI r20, FG_COLOR
    LDI r8, 0x00CDCD
    STORE r20, r8
    JMP sgr_ret

sgr_white:
    CMPI r7, 37
    JNZ r8, sgr_bright_black
    LDI r20, FG_COLOR
    LDI r8, 0xE5E5E5
    STORE r20, r8
    JMP sgr_ret

sgr_bright_black:
    CMPI r7, 90
    JNZ r8, sgr_bright_red
    LDI r20, FG_COLOR
    LDI r8, 0x808080
    STORE r20, r8
    JMP sgr_ret

sgr_bright_red:
    CMPI r7, 91
    JNZ r8, sgr_bright_green
    LDI r20, FG_COLOR
    LDI r8, 0xFF0000
    STORE r20, r8
    JMP sgr_ret

sgr_bright_green:
    CMPI r7, 92
    JNZ r8, sgr_bright_yellow
    LDI r20, FG_COLOR
    LDI r8, 0x00FF00
    STORE r20, r8
    JMP sgr_ret

sgr_bright_yellow:
    CMPI r7, 93
    JNZ r8, sgr_bright_blue
    LDI r20, FG_COLOR
    LDI r8, 0xFFFF00
    STORE r20, r8
    JMP sgr_ret

sgr_bright_blue:
    CMPI r7, 94
    JNZ r8, sgr_bright_magenta
    LDI r20, FG_COLOR
    LDI r8, 0x5C5CFF
    STORE r20, r8
    JMP sgr_ret

sgr_bright_magenta:
    CMPI r7, 95
    JNZ r8, sgr_bright_cyan
    LDI r20, FG_COLOR
    LDI r8, 0xFF00FF
    STORE r20, r8
    JMP sgr_ret

sgr_bright_cyan:
    CMPI r7, 96
    JNZ r8, sgr_bright_white
    LDI r20, FG_COLOR
    LDI r8, 0x00FFFF
    STORE r20, r8
    JMP sgr_ret

sgr_bright_white:
    CMPI r7, 97
    JNZ r8, sgr_ret
    LDI r20, FG_COLOR
    LDI r8, 0xFFFFFF
    STORE r20, r8

sgr_ret:
    ; Reset CSI_PARAM for next sequence
    LDI r20, CSI_PARAM
    LDI r8, 0
    STORE r20, r8

    POP r31
    RET

; =========================================
; SGR_256_TO_RGB -- convert 256-color index to 0xRRGGBB
; Input:  r7 = color index (0-255)
; Output: r8 = RGB color value
; Clobbers: r8, r4, r10, r0
; Preserves: r7, r15, r20, r31
; Palette:
;   0-7:   standard colors (match SGR 30-37)
;   8-15:  bright colors (match SGR 90-97)
;   16-231: 6x6x6 RGB cube  R=(n/36)*40+55, G=((n%36)/6)*40+55, B=(n%6)*40+55
;   232-255: grayscale ramp  v=(idx-232)*10+8
; =========================================
sgr_256_to_rgb:
    PUSH r31

    ; Check standard colors 0-15
    CMPI r7, 16
    BGE r8, sgr256_cube_check

    ; Standard color lookup (0-15)
    CMPI r7, 0
    JNZ r8, s256_1
    LDI r8, 0x555555
    JMP sgr256_ret
s256_1:
    CMPI r7, 1
    JNZ r8, s256_2
    LDI r8, 0xCD0000
    JMP sgr256_ret
s256_2:
    CMPI r7, 2
    JNZ r8, s256_3
    LDI r8, 0x00CD00
    JMP sgr256_ret
s256_3:
    CMPI r7, 3
    JNZ r8, s256_4
    LDI r8, 0xCDCD00
    JMP sgr256_ret
s256_4:
    CMPI r7, 4
    JNZ r8, s256_5
    LDI r8, 0x0000EE
    JMP sgr256_ret
s256_5:
    CMPI r7, 5
    JNZ r8, s256_6
    LDI r8, 0xCD00CD
    JMP sgr256_ret
s256_6:
    CMPI r7, 6
    JNZ r8, s256_7
    LDI r8, 0x00CDCD
    JMP sgr256_ret
s256_7:
    CMPI r7, 7
    JNZ r8, s256_8
    LDI r8, 0xE5E5E5
    JMP sgr256_ret
s256_8:
    CMPI r7, 8
    JNZ r8, s256_9
    LDI r8, 0x808080
    JMP sgr256_ret
s256_9:
    CMPI r7, 9
    JNZ r8, s256_10
    LDI r8, 0xFF0000
    JMP sgr256_ret
s256_10:
    CMPI r7, 10
    JNZ r8, s256_11
    LDI r8, 0x00FF00
    JMP sgr256_ret
s256_11:
    CMPI r7, 11
    JNZ r8, s256_12
    LDI r8, 0xFFFF00
    JMP sgr256_ret
s256_12:
    CMPI r7, 12
    JNZ r8, s256_13
    LDI r8, 0x5C5CFF
    JMP sgr256_ret
s256_13:
    CMPI r7, 13
    JNZ r8, s256_14
    LDI r8, 0xFF00FF
    JMP sgr256_ret
s256_14:
    CMPI r7, 14
    JNZ r8, s256_15
    LDI r8, 0x00FFFF
    JMP sgr256_ret
s256_15:
    LDI r8, 0xFFFFFF
    JMP sgr256_ret

sgr256_cube_check:
    CMPI r7, 232
    BLT r8, sgr256_cube

    ; Grayscale ramp: indices 232-255
    ; v = (index - 232) * 10 + 8
    LDI r8, 232
    SUB r7, r8        ; r7 = index - 232
    LDI r8, 10
    MUL r7, r8        ; r7 = (index - 232) * 10
    LDI r8, 8
    ADD r7, r8        ; r7 = v
    ; color = (v << 16) | (v << 8) | v
    PUSH r7           ; save v
    LDI r4, 16
    MOV r8, r7
    SHL r8, r4        ; r8 = v << 16
    PUSH r8           ; save high bits
    LDI r4, 8
    MOV r8, r7
    SHL r8, r4        ; r8 = v << 8
    OR r8, r7         ; r8 = (v << 8) | v
    POP r4            ; r4 = v << 16
    OR r8, r4         ; r8 = (v << 16) | (v << 8) | v
    POP r7            ; restore r7
    JMP sgr256_ret

sgr256_cube:
    ; RGB cube: indices 16-231
    ; n = index - 16
    LDI r8, 16
    SUB r7, r8        ; r7 = n = index - 16

    ; r = n / 36
    MOV r4, r7
    LDI r8, 36
    DIV r4, r8        ; r4 = r

    ; g = (n % 36) / 6
    MOV r10, r7
    LDI r8, 36
    MOD r10, r8        ; r10 = n % 36
    LDI r8, 6
    DIV r10, r8        ; r10 = g

    ; b = n % 6
    MOV r0, r7
    LDI r8, 6
    MOD r0, r8        ; r0 = b

    ; R = r * 40 + 55
    LDI r8, 40
    MUL r4, r8
    LDI r8, 55
    ADD r4, r8        ; r4 = R

    ; G = g * 40 + 55
    LDI r8, 40
    MUL r10, r8
    LDI r8, 55
    ADD r10, r8        ; r10 = G

    ; B = b * 40 + 55
    LDI r8, 40
    MUL r0, r8
    LDI r8, 55
    ADD r0, r8        ; r0 = B

    ; color = (R << 16) | (G << 8) | B
    MOV r8, r4
    LDI r7, 16
    SHL r8, r7        ; r8 = R << 16
    MOV r7, r10
    LDI r4, 8
    SHL r7, r4        ; r7 = G << 8
    OR r8, r7         ; r8 = (R << 16) | (G << 8)
    OR r8, r0         ; r8 = (R << 16) | (G << 8) | B

sgr256_ret:
    POP r31
    RET

; =========================================
; CSI_ERASE_LINE -- 'K' handler
; CSI_PARAM: 0=cursor to EOL (default), 1=BOL to cursor, 2=whole line
; =========================================
csi_erase_line:
    PUSH r31
    LDI r4, 1

    LDI r20, CSI_PARAM
    LOAD r7, r20       ; r7 = mode (0, 1, or 2)

    ; Get current row
    LDI r20, CUR_ROW
    LOAD r15, r20       ; r15 = row
    LDI r14, COLS
    MUL r15, r14         ; r15 = row * COLS

    ; Get current col
    LDI r20, CUR_COL
    LOAD r6, r20       ; r6 = col

    ; Determine start and end columns
    ; mode 0: col..COLS-1 (default)
    ; mode 1: 0..col
    ; mode 2: 0..COLS-1
    LDI r9, 0         ; r9 = start_col
    MOV r2, r6        ; r2 = end_col (exclusive)
    CMPI r7, 0
    JZ r8, cel_clear
    CMPI r7, 1
    JNZ r8, cel_mode2
    ; mode 1: 0..col+1
    LDI r9, 0
    ADD r2, r4        ; col+1
    JMP cel_clear
cel_mode2:
    ; mode 2: 0..COLS
    LDI r9, 0
    LDI r2, COLS

cel_clear:
    ; Clear text cells from start_col to end_col
    MOV r12, r9
cel_loop:
    CMP r12, r2
    BGE r8, cel_done
    LDI r20, BUF
    ADD r20, r15
    ADD r20, r12
    LDI r8, 32
    STORE r20, r8
    ; Clear color cell too
    LDI r20, COLOR_BUF
    LDI r8, 0
    ADD r8, r15
    ADD r8, r12
    LDI r3, FG_COLOR
    LOAD r3, r3
    ADD r20, r8
    STORE r20, r3
    ADD r12, r4
    JMP cel_loop

cel_done:
    LDI r20, DIRTY_STATUS
    LDI r8, 1
    STORE r20, r8
    ; Mark current row as dirty (row is in r15 / COLS)
    ; Re-derive row from saved value: r15 = row * COLS, row = r15 / COLS
    ; Actually we saved CUR_ROW into r15 early, then multiplied. Re-read CUR_ROW.
    LDI r20, CUR_ROW
    LOAD r8, r20
    CALL mark_row_dirty

    POP r31
    RET

; =========================================
; CSI_ERASE_DISPLAY -- 'J' handler
; CSI_PARAM: 0=cursor to end (default), 1=start to cursor, 2=whole screen
; =========================================
csi_erase_display:
    PUSH r31
    LDI r4, 1

    LDI r20, CSI_PARAM
    LOAD r7, r20       ; r7 = mode

    CMPI r7, 2
    JNZ r8, ced_check0

    ; Mode 2: clear entire screen
    CALL clear_entire_screen

    ; Reset cursor
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    LDI r20, CUR_ROW
    LDI r8, 0
    STORE r20, r8
    JMP ced_done

ced_check0:
    ; Mode 0: clear from cursor to end of screen
    ; Mode 1: clear from start to cursor
    ; For now just implement mode 0 (most common -- used by 'clear')
    ; Clear current row from cursor to end
    LDI r20, CUR_COL
    LOAD r6, r20
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r2, COLS
    MUL r9, r2
    ADD r9, r6        ; offset = row*COLS + col

    LDI r15, ROWS
    LDI r14, COLS
    MUL r15, r14         ; total cells
ced_loop0:
    CMP r9, r15
    BGE r8, ced_done
    LDI r20, BUF
    ADD r20, r9
    LDI r8, 32
    STORE r20, r8
    LDI r20, COLOR_BUF
    ADD r20, r9
    LDI r7, FG_COLOR
    LOAD r7, r7
    STORE r20, r7
    ADD r9, r4
    JMP ced_loop0

ced_done:
    LDI r20, DIRTY_STATUS
    LDI r8, 1
    STORE r20, r8
    CALL mark_all_dirty

    POP r31
    RET

; =========================================
; CSI_CURSOR_POSITION -- 'H' handler
; CSI_PARAM2 = row (1-based, 0 or omitted = 1)
; CSI_PARAM  = col (1-based, 0 or omitted = 1)
; =========================================
csi_cursor_position:
    PUSH r31
    LDI r4, 1

    ; Row: CSI_PARAM2, default 0 means row 1
    LDI r20, CSI_PARAM2
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, ccp_row_set
    LDI r7, 1
ccp_row_set:
    SUB r7, r4         ; convert to 0-based
    CMPI r7, 0
    BGE r8, ccp_row_clamp
    LDI r7, 0
ccp_row_clamp:
    LDI r15, ROWS
    SUB r15, r4
    CMP r7, r15
    BLT r8, ccp_row_ok
    MOV r7, r15
ccp_row_ok:
    LDI r20, CUR_ROW
    STORE r20, r7

    ; Col: CSI_PARAM, default 0 means col 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, ccp_col_set
    LDI r7, 1
ccp_col_set:
    SUB r7, r4         ; convert to 0-based
    CMPI r7, 0
    BGE r8, ccp_col_clamp
    LDI r7, 0
ccp_col_clamp:
    LDI r15, COLS
    SUB r15, r4
    CMP r7, r15
    BLT r8, ccp_col_ok
    MOV r7, r15
ccp_col_ok:
    LDI r20, CUR_COL
    STORE r20, r7

    POP r31
    RET

; =========================================
; CSI cursor movement A/B/C/D
; CSI_PARAM = count (default 1)
; =========================================
csi_cursor_up:
    PUSH r31
    LDI r4, 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, ccu_move
    LDI r7, 1
ccu_move:
    LDI r20, CUR_ROW
    LOAD r15, r20
    SUB r15, r7
    CMPI r15, 0
    BGE r8, ccu_ok
    LDI r15, 0
ccu_ok:
    STORE r20, r15
    POP r31
    RET

csi_cursor_down:
    PUSH r31
    LDI r4, 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, ccd_move
    LDI r7, 1
ccd_move:
    LDI r20, CUR_ROW
    LOAD r15, r20
    ADD r15, r7
    LDI r14, ROWS
    SUB r14, r4
    CMP r15, r14
    BLT r8, ccd_ok
    MOV r15, r14
ccd_ok:
    STORE r20, r15
    POP r31
    RET

csi_cursor_right:
    PUSH r31
    LDI r4, 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, ccr_move
    LDI r7, 1
ccr_move:
    LDI r20, CUR_COL
    LOAD r15, r20
    ADD r15, r7
    LDI r14, COLS
    SUB r14, r4
    CMP r15, r14
    BLT r8, ccr_ok
    MOV r15, r14
ccr_ok:
    STORE r20, r15
    POP r31
    RET

csi_cursor_left:
    PUSH r31
    LDI r4, 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, ccl_move
    LDI r7, 1
ccl_move:
    LDI r20, CUR_COL
    LOAD r15, r20
    SUB r15, r7
    CMPI r15, 0
    BGE r8, ccl_ok
    LDI r15, 0
ccl_ok:
    STORE r20, r15
    POP r31
    RET

; =========================================
; CSI_CURSOR_NEXT_LINE -- 'E' handler (CNL)
; Move cursor N lines down, column to start
; CSI_PARAM = count (default 1)
; =========================================
csi_cursor_next_line:
    PUSH r31
    LDI r4, 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, cnl_move
    LDI r7, 1
cnl_move:
    LDI r20, CUR_ROW
    LOAD r15, r20
    ADD r15, r7
    LDI r14, ROWS
    SUB r14, r4
    CMP r15, r14
    BLT r8, cnl_ok
    MOV r15, r14
cnl_ok:
    STORE r20, r15
    ; Move column to 0
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    POP r31
    RET

; =========================================
; CSI_CURSOR_PREV_LINE -- 'F' handler (CPL)
; Move cursor N lines up, column to start
; CSI_PARAM = count (default 1)
; =========================================
csi_cursor_prev_line:
    PUSH r31
    LDI r4, 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, cpl_move
    LDI r7, 1
cpl_move:
    LDI r20, CUR_ROW
    LOAD r15, r20
    SUB r15, r7
    CMPI r15, 0
    BGE r8, cpl_ok
    LDI r15, 0
cpl_ok:
    STORE r20, r15
    ; Move column to 0
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    POP r31
    RET

; =========================================
; CSI_CURSOR_HABSOLUTE -- 'G' handler (CHA)
; Set cursor column to N (1-based)
; CSI_PARAM = column (default 1)
; =========================================
csi_cursor_habsolute:
    PUSH r31
    LDI r4, 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, cha_set
    LDI r7, 1
cha_set:
    SUB r7, r4         ; convert to 0-based
    CMPI r7, 0
    BGE r8, cha_clamp
    LDI r7, 0
cha_clamp:
    LDI r15, COLS
    SUB r15, r4
    CMP r7, r15
    BLT r8, cha_ok
    MOV r7, r15
cha_ok:
    LDI r20, CUR_COL
    STORE r20, r7
    POP r31
    RET

; =========================================
; CSI_CURSOR_VABSOLUTE -- 'd' handler (VPA)
; Set cursor row to N (1-based)
; CSI_PARAM = row (default 1)
; =========================================
csi_cursor_vabsolute:
    PUSH r31
    LDI r4, 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, cva_set
    LDI r7, 1
cva_set:
    SUB r7, r4         ; convert to 0-based
    CMPI r7, 0
    BGE r8, cva_clamp
    LDI r7, 0
cva_clamp:
    LDI r15, ROWS
    SUB r15, r4
    CMP r7, r15
    BLT r8, cva_ok
    MOV r7, r15
cva_ok:
    LDI r20, CUR_ROW
    STORE r20, r7
    POP r31
    RET

; =========================================
; CSI_INSERT_LINES -- 'L' handler
; Insert N blank lines at cursor row, pushing lines down
; CSI_PARAM = count (default 1)
; =========================================
csi_insert_lines:
    PUSH r31
    LDI r4, 1

    ; Get count, default 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, cil_count
    LDI r7, 1
cil_count:

    ; Get cursor row
    LDI r20, CUR_ROW
    LOAD r15, r20       ; r15 = cursor row

    ; Shift rows from bottom up: row N-1 -> row N (for N > cursor_row)
    ; Iterate from ROWS-2 down to cursor_row
    LDI r9, ROWS
    SUB r9, r4        ; r9 = ROWS-1 (source row, start from bottom-1)
cil_shift:
    CMP r9, r15
    BLT r8, cil_clear

    ; dst = BUF + (r9+1) * COLS
    LDI r21, BUF
    MOV r8, r9
    ADD r8, r4
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8

    ; src = BUF + r9 * COLS
    LDI r20, BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8

    MEMCPY r21, r20, r2

    ; Same for color buffer
    LDI r21, COLOR_BUF
    MOV r8, r9
    ADD r8, r4
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8

    LDI r20, COLOR_BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8

    MEMCPY r21, r20, r2

    SUB r9, r4
    JMP cil_shift

cil_clear:
    ; Clear N lines starting at cursor row
    MOV r9, r15        ; r9 = starting row
    LDI r22, 0         ; r22 = lines cleared count
cil_clear_loop:
    CMP r22, r7
    BGE r8, cil_done
    CMP r9, r15
    LDI r14, ROWS
    SUB r14, r4
    BGE r8, cil_skip   ; skip if past last row
    ; Actually check r9 >= ROWS-1
    ; Clear this row
    LDI r20, BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8
    LDI r8, 32
    LDI r23, 0
cil_clr_txt:
    CMP r23, r2
    BGE r8, cil_clr_color
    STORE r20, r8
    ADD r20, r4
    ADD r23, r4
    JMP cil_clr_txt

cil_clr_color:
    LDI r20, COLOR_BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8
    LDI r7, FG_COLOR
    LOAD r7, r7
    LDI r23, 0
cil_clr_col:
    CMP r23, r2
    BGE r8, cil_next_row
    STORE r20, r7
    ADD r20, r4
    ADD r23, r4
    JMP cil_clr_col

cil_skip:
    ; Past last row, skip
cil_next_row:
    ADD r9, r4
    ADD r22, r4
    JMP cil_clear_loop

cil_done:
    CALL mark_all_dirty
    POP r31
    RET

; =========================================
; CSI_DELETE_LINES -- 'M' handler
; Delete N lines at cursor row, pulling lines up from below
; CSI_PARAM = count (default 1)
; =========================================
csi_delete_lines:
    PUSH r31
    LDI r4, 1

    ; Get count, default 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, cdl_count
    LDI r7, 1
cdl_count:

    ; Get cursor row
    LDI r20, CUR_ROW
    LOAD r15, r20       ; r15 = cursor row

    ; Shift rows from cursor_row+N up: row+N -> row
    ; Iterate from cursor_row to ROWS-2
    MOV r9, r15        ; r9 = dst row
cdl_shift:
    LDI r14, ROWS
    SUB r14, r4
    CMP r9, r14
    BGE r8, cdl_clear

    ; src row = r9 + count
    MOV r8, r9
    ADD r8, r7
    LDI r6, ROWS
    SUB r6, r4
    CMP r8, r6
    BGE r8, cdl_clear_src  ; if src past last row, clear instead

    ; dst = BUF + r9 * COLS
    LDI r21, BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8

    ; src = BUF + (r9 + count) * COLS
    LDI r20, BUF
    MOV r8, r9
    ADD r8, r7
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8

    MEMCPY r21, r20, r2

    ; Same for color buffer
    LDI r21, COLOR_BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8

    LDI r20, COLOR_BUF
    MOV r8, r9
    ADD r8, r7
    LDI r2, COLS
    MUL r8, r2
    ADD r20, r8

    MEMCPY r21, r20, r2

    ADD r9, r4
    JMP cdl_shift

cdl_clear_src:
    ; Source past last row -- clear this dst row instead
    LDI r21, BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8
    LDI r8, 32
    LDI r23, 0
cdl_cs_txt:
    CMP r23, r2
    BGE r8, cdl_cs_col
    STORE r21, r8
    ADD r21, r4
    ADD r23, r4
    JMP cdl_cs_txt
cdl_cs_col:
    LDI r21, COLOR_BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8
    LDI r7, FG_COLOR
    LOAD r7, r7
    LDI r23, 0
cdl_cs_c:
    CMP r23, r2
    BGE r8, cdl_cs_done
    STORE r21, r7
    ADD r21, r4
    ADD r23, r4
    JMP cdl_cs_c
cdl_cs_done:
    ADD r9, r4
    JMP cdl_shift

cdl_clear:
    ; Clear N lines at the bottom
    LDI r14, ROWS
    SUB r14, r4         ; r14 = ROWS-1
    MOV r9, r14
    SUB r9, r7
    ADD r9, r4        ; r9 = first row to clear (ROWS - count)
    CMP r9, r15
    BGE r8, cdl_done2  ; if nothing to clear, skip
    LDI r22, 0
cdl_clr_loop:
    CMP r22, r7
    BGE r8, cdl_done2
    ; Clear row r9
    LDI r21, BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8
    LDI r8, 32
    LDI r23, 0
cdl_clr_t:
    CMP r23, r2
    BGE r8, cdl_clr_c2
    STORE r21, r8
    ADD r21, r4
    ADD r23, r4
    JMP cdl_clr_t
cdl_clr_c2:
    LDI r21, COLOR_BUF
    MOV r8, r9
    LDI r2, COLS
    MUL r8, r2
    ADD r21, r8
    LDI r7, FG_COLOR
    LOAD r7, r7
    LDI r23, 0
cdl_clr_cc:
    CMP r23, r2
    BGE r8, cdl_clr_next
    STORE r21, r7
    ADD r21, r4
    ADD r23, r4
    JMP cdl_clr_cc
cdl_clr_next:
    ADD r9, r4
    ADD r22, r4
    JMP cdl_clr_loop

cdl_done2:
    CALL mark_all_dirty
    POP r31
    RET

; =========================================
; CSI_DELETE_CHARS -- 'P' handler (DCH)
; Delete N chars at cursor, shifting chars left
; CSI_PARAM = count (default 1)
; =========================================
csi_delete_chars:
    PUSH r31
    LDI r4, 1

    ; Get count, default 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, cdc_count
    LDI r7, 1
cdc_count:

    ; Get cursor position
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r20, CUR_COL
    LOAD r14, r20       ; r14 = cursor col

    ; Base offset = row * COLS
    LDI r6, COLS
    MOV r8, r15
    MUL r8, r6
    MOV r15, r8         ; r15 = row * COLS (base offset)

    ; Shift chars left: col+N -> col, col+N+1 -> col+1, etc.
    MOV r9, r14        ; r9 = dst col (starting at cursor)
cdc_shift:
    ADD r8, r9
    ADD r8, r7         ; r9 + count = src col
    LDI r6, COLS
    CMP r8, r6
    BGE r8, cdc_clear  ; if src >= COLS, clear instead

    ; dst = BUF + base + dst_col
    LDI r21, BUF
    MOV r8, r15
    ADD r21, r8
    ADD r21, r9

    ; src = BUF + base + dst_col + count
    LDI r20, BUF
    MOV r8, r15
    ADD r20, r8
    ADD r20, r9
    ADD r20, r7

    ; Copy one cell
    LOAD r8, r20
    STORE r21, r8

    ; Same for color buffer
    LDI r21, COLOR_BUF
    MOV r8, r15
    ADD r21, r8
    ADD r21, r9

    LDI r20, COLOR_BUF
    MOV r8, r15
    ADD r20, r8
    ADD r20, r9
    ADD r20, r7

    LOAD r8, r20
    STORE r21, r8

    ADD r9, r4
    JMP cdc_shift

cdc_clear:
    ; Clear N chars at end of line (COLS - count to COLS-1)
    LDI r9, COLS
    SUB r9, r7        ; r9 = first col to clear
    LDI r6, COLS
    CMP r9, r14
    BGE r8, cdc_skip   ; if clear area starts after cursor, nothing to clear
    ; r9 < r14 is guaranteed here (BGE above would have branched)
    JMP cdc_do_clear
cdc_do_clear:
    LDI r22, 0         ; clear counter
cdc_clr_loop:
    CMP r22, r7
    BGE r8, cdc_skip
    ; Clear cell at (row, COLS - count + counter)
    LDI r20, BUF
    MOV r8, r15
    ADD r20, r8
    ADD r20, r9
    LDI r8, 32
    STORE r20, r8

    LDI r20, COLOR_BUF
    MOV r8, r15
    ADD r20, r8
    ADD r20, r9
    LDI r8, FG_COLOR
    LOAD r8, r8
    STORE r20, r8

    ADD r9, r4
    ADD r22, r4
    JMP cdc_clr_loop

cdc_skip:
    ; Mark current row dirty
    LDI r20, CUR_ROW
    LOAD r8, r20
    CALL mark_row_dirty
    POP r31
    RET

; =========================================
; CSI_INSERT_CHARS -- '@' handler (ICH)
; Insert N blank chars at cursor, shifting chars right
; CSI_PARAM = count (default 1)
; =========================================
csi_insert_chars:
    PUSH r31
    LDI r4, 1

    ; Get count, default 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, cic_count
    LDI r7, 1
cic_count:

    ; Get cursor position
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r20, CUR_COL
    LOAD r14, r20       ; r14 = cursor col

    ; Base offset = row * COLS
    LDI r6, COLS
    MOV r8, r15
    MUL r8, r6
    MOV r15, r8         ; r15 = row * COLS (base offset)

    ; Shift chars right: from COLS-1-count down to cursor col
    LDI r9, COLS
    SUB r9, r4        ; r9 = COLS-1 (start from rightmost)
    SUB r9, r7        ; r9 = COLS-1-count (first dst position)
cic_shift:
    CMP r9, r14
    BLT r8, cic_clear

    ; dst = BUF + base + r9 + count
    LDI r21, BUF
    MOV r8, r15
    ADD r21, r8
    ADD r21, r9
    ADD r21, r7

    ; src = BUF + base + r9
    LDI r20, BUF
    MOV r8, r15
    ADD r20, r8
    ADD r20, r9

    ; Copy one cell
    LOAD r8, r20
    STORE r21, r8

    ; Same for color buffer
    LDI r21, COLOR_BUF
    MOV r8, r15
    ADD r21, r8
    ADD r21, r9
    ADD r21, r7

    LDI r20, COLOR_BUF
    MOV r8, r15
    ADD r20, r8
    ADD r20, r9

    LOAD r8, r20
    STORE r21, r8

    SUB r9, r4
    JMP cic_shift

cic_clear:
    ; Clear N chars starting at cursor col
    MOV r9, r14        ; r9 = cursor col
    LDI r22, 0
cic_clr_loop:
    CMP r22, r7
    BGE r8, cic_done
    LDI r20, BUF
    MOV r8, r15
    ADD r20, r8
    ADD r20, r9
    LDI r8, 32
    STORE r20, r8

    LDI r20, COLOR_BUF
    MOV r8, r15
    ADD r20, r8
    ADD r20, r9
    LDI r8, FG_COLOR
    LOAD r8, r8
    STORE r20, r8

    ADD r9, r4
    ADD r22, r4
    JMP cic_clr_loop

cic_done:
    ; Mark current row dirty
    LDI r20, CUR_ROW
    LOAD r8, r20
    CALL mark_row_dirty
    POP r31
    RET

; =========================================
; CSI_SCROLL_UP -- 'S' handler (SU)
; Scroll entire screen up N lines (content moves up)
; CSI_PARAM = count (default 1)
; =========================================
csi_scroll_up:
    PUSH r31
    LDI r4, 1

    ; Get count, default 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, csu_count
    LDI r7, 1
csu_count:
csu_loop:
    CMP r7, r4
    BLT r8, csu_done
    CALL scroll_up
    SUB r7, r4
    JMP csu_loop
csu_done:
    POP r31
    RET

; =========================================
; CSI_SCROLL_DOWN -- 'T' handler (SD)
; Scroll entire screen down N lines (content moves down)
; CSI_PARAM = count (default 1)
; =========================================
csi_scroll_down:
    PUSH r31
    LDI r4, 1

    ; Get count, default 1
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, csd_count
    LDI r7, 1
csd_count:
csd_loop:
    CMP r7, r4
    BLT r8, csd_done
    CALL scroll_down
    SUB r7, r4
    JMP csd_loop
csd_done:
    POP r31
    RET

; =========================================
; CSI_SET_SCROLL_REGION -- 'r' handler (DECSTBM)
; CSI_PARAM2 = top (1-based, default 1)
; CSI_PARAM  = bottom (1-based, default ROWS)
; Cursor moves to home position (0,0)
; Note: We don't actually use scroll regions for cursor
; clamping, but we accept the sequence for compatibility.
; =========================================
csi_set_scroll_region:
    PUSH r31
    LDI r4, 1

    ; Top: CSI_PARAM2 (1-based), default 1
    LDI r20, CSI_PARAM2
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, csr_top
    LDI r7, 1
csr_top:
    SUB r7, r4         ; convert to 0-based
    CMPI r7, 0
    BGE r8, csr_top_ok
    LDI r7, 0
csr_top_ok:
    LDI r20, SCROLL_TOP
    STORE r20, r7

    ; Bottom: CSI_PARAM (1-based), default ROWS
    LDI r20, CSI_PARAM
    LOAD r7, r20
    CMPI r7, 0
    JNZ r8, csr_bot
    LDI r7, ROWS
csr_bot:
    SUB r7, r4         ; convert to 0-based
    LDI r15, ROWS
    SUB r15, r4
    CMP r7, r15
    BLT r8, csr_bot_ok
    MOV r7, r15
csr_bot_ok:
    LDI r20, SCROLL_BOT
    STORE r20, r7

    ; Move cursor to home position
    LDI r20, CUR_ROW
    LDI r8, 0
    STORE r20, r8
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    POP r31
    RET

; =========================================
; SAVE/RESTORE CURSOR (ESC 7/8 and CSI s/u)
; =========================================

save_cursor:
    LDI r20, CUR_ROW
    LOAD r7, r20
    LDI r21, SAVED_ROW
    STORE r21, r7
    LDI r20, CUR_COL
    LOAD r7, r20
    LDI r21, SAVED_COL
    STORE r21, r7
    LDI r20, FG_COLOR
    LOAD r7, r20
    LDI r21, SAVED_FG
    STORE r21, r7
    RET

restore_cursor:
    LDI r21, SAVED_ROW
    LOAD r7, r21
    LDI r20, CUR_ROW
    STORE r20, r7
    LDI r21, SAVED_COL
    LOAD r7, r21
    LDI r20, CUR_COL
    STORE r20, r7
    LDI r21, SAVED_FG
    LOAD r7, r21
    LDI r20, FG_COLOR
    STORE r20, r7
    RET

; =========================================
; CLEAR ENTIRE SCREEN -- clear text + color buffers
; =========================================

clear_entire_screen:
    PUSH r31
    LDI r4, 1
    ; Clear text buffer
    LDI r20, BUF
    LDI r7, 32
    LDI r9, 0
ces_text:
    STORE r20, r7
    ADD r20, r4
    ADD r9, r4
    LDI r15, ROWS
    LDI r14, COLS
    MUL r15, r14
    CMP r9, r15
    BLT r8, ces_text
    ; Clear color buffer
    LDI r20, COLOR_BUF
    LDI r7, FG_COLOR
    LOAD r7, r7
    LDI r9, 0
ces_color:
    STORE r20, r7
    ADD r20, r4
    ADD r9, r4
    LDI r15, ROWS
    LDI r14, COLS
    MUL r15, r14
    CMP r9, r15
    BLT r8, ces_color
    CALL mark_all_dirty
    POP r31
    RET

; =========================================
; ALT SCREEN -- fake alt screen buffer support
; ESC[?1049h: save cursor, clear screen, set ALT_ACTIVE
; ESC[?1049l: clear screen, restore cursor, clear ALT_ACTIVE
; =========================================

alt_screen_on:
    PUSH r31
    ; Save current cursor position
    LDI r20, CUR_ROW
    LOAD r8, r20
    LDI r21, ALT_SAVE_ROW
    STORE r21, r8
    LDI r20, CUR_COL
    LOAD r8, r20
    LDI r21, ALT_SAVE_COL
    STORE r21, r8
    ; Clear the screen (same as ESC[2J)
    CALL clear_entire_screen
    ; Home cursor
    LDI r20, CUR_ROW
    LDI r8, 0
    STORE r20, r8
    LDI r20, CUR_COL
    STORE r20, r8
    ; Mark alt screen active
    LDI r20, ALT_ACTIVE
    LDI r8, 1
    STORE r20, r8
    POP r31
    RET

alt_screen_off:
    PUSH r31
    ; Clear the screen
    CALL clear_entire_screen
    ; Restore cursor position
    LDI r20, ALT_SAVE_ROW
    LOAD r8, r20
    LDI r21, CUR_ROW
    STORE r21, r8
    LDI r20, ALT_SAVE_COL
    LOAD r8, r20
    LDI r21, CUR_COL
    STORE r21, r8
    ; Clear alt screen flag
    LDI r20, ALT_ACTIVE
    LDI r8, 0
    STORE r20, r8
    POP r31
    RET

; =========================================
; RENDER -- redraw text buffer using SMALLTEXT (3x5 font)
; Terminal area starts at y=10, 6px per row (5px glyph + 1px spacing)
; 30 rows * 6px = 180px. Total: 10 + 180 = 190px (fits in 256px)
; Now uses color-run rendering from COLOR_BUF
; =========================================
render:
    PUSH r31
    LDI r4, 1

    ; Reset dirty row render counter
    LDI r20, RENDERED_ROWS
    LDI r8, 0
    STORE r20, r8

    ; Only redraw status bar when dirty
    LDI r20, DIRTY_STATUS
    LOAD r8, r20
    JZ r8, render_skip_status
    CALL draw_status_bar
    LDI r20, DIRTY_STATUS
    LDI r8, 0
    STORE r20, r8

render_skip_status:

    ; --- Dirty rectangle optimization ---
    ; Check if any rows need redrawing
    LDI r20, DIRTY_ROWS
    LOAD r8, r20
    JZ r8, render_cursor_blink  ; no dirty rows, skip to cursor

    LDI r4, 1
    LDI r9, 0
    LDI r12, 10
    LDI r15, COLS

render_row:
    ; --- Check if this row is dirty ---
    MOV r8, r9
    CALL mark_row_dirty_check
    JZ r8, render_row_skip
    LDI r4, 1           ; restore r4 (clobbered by mark_row_dirty_check)

    ; Increment rendered-rows counter
    PUSH r4
    LDI r20, RENDERED_ROWS
    LOAD r8, r20
    ADD r8, r4
    STORE r20, r8
    POP r4

    ; Clear only this row's background (full width, 6px tall)
    LDI r11, 0          ; x (use r11 to preserve r4)
    MOV r5, r12         ; y = 10 + row*6
    LDI r1, 256         ; w
    LDI r10, 6           ; h
    LDI r0, 0x0A0A0A    ; bg color
    RECTF r11, r5, r1, r10, r0

    ; Compute row base addresses
    MOV r2, r9
    MUL r2, r15
    LDI r25, BUF
    ADD r25, r2
    LDI r26, COLOR_BUF
    ADD r26, r2

    LDI r20, 0

render_run:
    ; Check if past end of row
    CMP r20, r15
    BGE r8, end_row

    ; Read run-start color
    MOV r27, r26
    ADD r27, r20
    LOAD r22, r27

    ; Scan for end of same-color run
    MOV r21, r20

rr_scan:
    CMP r21, r15
    BGE r8, rr_emit

    MOV r27, r26
    ADD r27, r21
    LOAD r23, r27
    CMP r23, r22
    JNZ r8, rr_emit

    ADD r21, r4
    JMP rr_scan

rr_emit:
    ; Copy run chars to scratch buffer
    LDI r23, 0
    MOV r24, r20

rr_copy:
    CMP r24, r21
    BGE r8, rr_copy_done
    MOV r27, r25
    ADD r27, r24
    LOAD r7, r27
    LDI r27, SCRATCH
    ADD r27, r23
    STORE r27, r7
    ADD r23, r4
    ADD r24, r4
    JMP rr_copy

rr_copy_done:
    ; Null-terminate scratch
    LDI r27, SCRATCH
    ADD r27, r23
    LDI r7, 0
    STORE r27, r7

    ; Skip empty runs
    CMP r23, r7
    JZ r8, rr_next

    ; Compute x pixel pos (col * 3)
    MOV r11, r20
    LDI r7, 3
    MUL r11, r7
    MOV r3, r12
    LDI r1, SCRATCH
    MOV r10, r22
    LDI r0, 0
    SMALLTEXT r11, r3, r1, r10, r0

rr_next:
    MOV r20, r21
    JMP render_run

end_row:
    LDI r7, 6
    ADD r12, r7

render_row_skip:
    ADD r9, r4
    CMPI r9, ROWS
    BLT r8, render_row

    ; Clear dirty bitmap after rendering
    LDI r20, DIRTY_ROWS
    LDI r8, 0
    STORE r20, r8

render_cursor_blink:
    ; Cursor blink
    LDI r20, BLINK
    LOAD r8, r20
    LDI r15, 8
    AND r8, r15
    CMPI r8, 4
    BGE r8, cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r8, r20
    LDI r15, 3
    MUL r8, r15
    LDI r20, CUR_ROW
    LOAD r5, r20
    LDI r15, 6
    MUL r5, r15
    LDI r1, 10
    ADD r5, r1
    LDI r1, 2
    LDI r10, 5
    LDI r0, 0x44FF44
    RECTF r8, r5, r1, r10, r0

cursor_done:
    POP r31
    RET
