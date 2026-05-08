; DESCRIPTION: This GeOS assembly code initializes a window manager for Geometry OS with two windows: a terminal (PTY) and a system monitor. The terminal is focusable and draggable, receives keyboard input when focused, and renders PTY output as vertical bars. The system monitor updates periodically to show activity indicators and redraws pixel art text "GEOS". The code manages window interactions, handles mouse events for dragging and closing windows, and ensures responsiveness by limiting data reads from the PTY.

; window_manager.asm -- Geometry OS Desktop Shell
;
; Two windows: terminal (PTY) + system monitor.
; Click title bar to focus/drag, close button to destroy.
; Keyboard routes to focused window.
;
; RAM Layout:
;   0x4E00  term_win_id
;   0x4E01  sysmon_win_id
;   0x4E02  pty_handle
;   0x4E03  focused_win
;   0x4E04  frame_count
;   0x4E05  drag_win
;   0x4E06  drag_offset_x
;   0x4E07  drag_offset_y
;   0x4E08  blink_counter
;   0x4E09  dirty_sysmon
;   0x4E0A  term_cur_x
;   0x4E0B  term_cur_y
;   0x5000  title "Terminal" (null-terminated)
;   0x5020  title "Monitor" (null-terminated)
;   0x5100  temp string area
;   0x5200  PTY recv buffer
;   0x5300  PTY send buffer

#define TERM_WIN     0x4E00
#define SYSMON_WIN   0x4E01
#define PTY_HANDLE   0x4E02
#define FOCUSED_WIN  0x4E03
#define FRAME_COUNT  0x4E04
#define DRAG_WIN     0x4E05
#define DRAG_OX      0x4E06
#define DRAG_OY      0x4E07
#define BLINK_COUNT  0x4E08
#define DIRTY_SYSMON 0x4E09
#define TERM_CUR_X   0x4E0A
#define TERM_CUR_Y   0x4E0B
#define ANSI_ESCAPE  0x4E0C
#define TITLE_TERM   0x5000
#define TITLE_MON    0x5020
#define TEMP_AREA    0x5100
#define PTY_RECV     0x5200
#define PTY_SEND     0x5300

; Colors
#define COL_DESKTOP   0x0F0F1A
#define COL_TASKBAR   0x1A1A2E
#define COL_GREEN     0x44DD44
#define COL_CYAN      0x44DDDD
#define COL_YELLOW    0xDDDD44

; =========================================
; INIT
; =========================================

LDI r4, 1
LDI r30, 0xFD00

; Clear screen
LDI r11, 0x0A0A0A
FILL r11

; Desktop background (256 x 240)
LDI r4, 0
LDI r10, 0
LDI r14, 256
LDI r2, 240
LDI r15, COL_DESKTOP
RECTF r4, r10, r14, r2, r15

; Taskbar (256 x 16)
LDI r4, 0
LDI r10, 240
LDI r14, 256
LDI r2, 16
LDI r15, COL_TASKBAR
RECTF r4, r10, r14, r2, r15

; Taskbar label
LDI r20, TEMP_AREA
STRO r20, "Geometry OS"
LDI r4, 4
LDI r10, 243
LDI r14, TEMP_AREA
LDI r2, COL_GREEN
LDI r15, COL_TASKBAR
SMALLTEXT r4, r10, r14, r2, r15

; Init all variables to 0
LDI r20, TERM_WIN
LDI r11, 0
STORE r20, r11
LDI r20, SYSMON_WIN
STORE r20, r11
LDI r20, FOCUSED_WIN
STORE r20, r11
LDI r20, FRAME_COUNT
STORE r20, r11
LDI r20, DRAG_WIN
STORE r20, r11
LDI r20, BLINK_COUNT
STORE r20, r11
LDI r20, TERM_CUR_X
LDI r11, 0
STORE r20, r11
LDI r20, TERM_CUR_Y
LDI r11, 0
STORE r20, r11

; ANSI escape state: 0 = normal, 1 = in escape sequence
LDI r20, ANSI_ESCAPE
LDI r11, 0
STORE r20, r11

; PTY handle init to invalid
LDI r20, PTY_HANDLE
LDI r11, 0xFFFF
STORE r20, r11

; Dirty sysmon = start dirty
LDI r20, DIRTY_SYSMON
LDI r11, 1
STORE r20, r11

; =========================================
; PREPARE TITLE STRINGS (separate addresses!)
; =========================================

; "Terminal" at 0x5000
LDI r20, TITLE_TERM
STRO r20, "Terminal"

; "Monitor" at 0x5020
LDI r20, TITLE_MON
STRO r20, "Monitor"

; =========================================
; CREATE WINDOWS
; =========================================

; Terminal: x=4, y=6, w=180, h=168
LDI r4, 4
LDI r10, 6
LDI r14, 180
LDI r2, 168
LDI r15, TITLE_TERM
LDI r11, 0
WINSYS r11
; r11 = window_id
LDI r20, TERM_WIN
STORE r20, r11

; Monitor: x=192, y=6, w=60, h=100
LDI r4, 192
LDI r10, 6
LDI r14, 60
LDI r2, 100
LDI r15, TITLE_MON
LDI r11, 0
WINSYS r11
; r11 = window_id
LDI r20, SYSMON_WIN
STORE r20, r11

; Focus terminal by default
LDI r20, FOCUSED_WIN
LDI r11, TERM_WIN
LOAD r11, r11
STORE r20, r11

; =========================================
; OPEN PTY FOR TERMINAL
; =========================================

; Null-terminate send buffer
LDI r20, PTY_SEND
LDI r11, 0
STORE r20, r11

; Open PTY: PTYOPEN cmd_addr_reg, handle_reg
LDI r15, PTY_SEND
PTYOPEN r15, r3
; r3 = slot index (handle), r11 = status

; Store handle
LDI r20, PTY_HANDLE
STORE r20, r3

; Also keep a copy in r28 for PTYWRITE/PTYREAD
LDI r28, 0
ADD r28, r3

; Set PTY size 24x80
LDI r1, 24
LDI r5, 80
PTYSIZE r28, r1, r5

; Send "clear" to PTY
LDI r20, PTY_SEND
STRO r20, "clear\n"
LDI r6, PTY_SEND
LDI r12, 6
PTYWRITE r28, r6, r12

LDI r4, 1

; =========================================
; MAIN LOOP
; =========================================

main_loop:
    LDI r4, 1

    CALL handle_mouse
    CALL drain_pty
    CALL update_sysmon
    CALL update_taskbar

    ; Increment counters
    LDI r20, BLINK_COUNT
    LOAD r11, r20
    ADD r11, r4
    STORE r20, r11

    LDI r20, FRAME_COUNT
    LOAD r11, r20
    ADD r11, r4
    STORE r20, r11

    FRAME

    ; Keyboard -> PTY if terminal focused
    IKEY r15
    JZ r15, main_loop

    LDI r20, FOCUSED_WIN
    LOAD r11, r20
    LDI r20, TERM_WIN
    LOAD r20, r20
    CMP r11, r20
    JNZ r11, main_loop

    ; Forward key to PTY
    LDI r20, PTY_SEND
    STORE r20, r15
    LDI r6, PTY_SEND
    LDI r12, 1
    PTYWRITE r28, r6, r12
    JMP main_loop

; =========================================
; HANDLE_MOUSE
; =========================================
handle_mouse:
    PUSH r31
    LDI r4, 1

    MOUSEQ r15
    ; r15=mx, r6=my, r12=btn

    ; Click (btn==2)
    CMPI r12, 2
    JNZ r11, hm_check_drag

    ; WINSYS HITTEST (op=4): r11=win_id, r4=hit_type
    LDI r11, 4
    WINSYS r11
    CMPI r11, 0
    JZ r11, hm_clear_drag

    ; hit_type 3 = close button
    CMPI r4, 3
    JNZ r11, hm_check_title
    ; Destroy window
    LDI r11, 1
    WINSYS r11
    ; Clear focus if we closed the focused window
    LDI r20, FOCUSED_WIN
    LDI r11, 0
    STORE r20, r11
    JMP hm_done

hm_check_title:
    ; hit_type 1 = title bar
    CMPI r4, 1
    JNZ r11, hm_check_body

    ; Focus + bring to front
    LDI r20, FOCUSED_WIN
    STORE r20, r11
    LDI r11, 2
    WINSYS r11

    ; Start drag: save win_id and mouse offset
    LDI r20, DRAG_WIN
    LDI r11, FOCUSED_WIN
    LOAD r11, r11
    STORE r20, r11

    ; Get window position via WINFO (op=6)
    LDI r11, 6
    LDI r4, TEMP_AREA
    WINSYS r11
    ; TEMP_AREA[0]=x, TEMP_AREA[1]=y
    LDI r20, TEMP_AREA
    LOAD r8, r20
    ADD r20, r4
    LOAD r7, r20
    SUB r8, r15
    SUB r7, r6
    LDI r20, DRAG_OX
    STORE r20, r8
    LDI r20, DRAG_OY
    STORE r20, r7
    JMP hm_done

hm_check_body:
    ; hit_type 2 = body -> focus only
    LDI r20, FOCUSED_WIN
    STORE r20, r11
    LDI r11, 2
    WINSYS r11
    JMP hm_done

hm_check_drag:
    ; btn==1 (held down) -> drag if active
    CMPI r12, 1
    JNZ r11, hm_clear_drag

    LDI r20, DRAG_WIN
    LOAD r11, r20
    CMPI r11, 0
    JZ r11, hm_clear_drag

    ; Move window: new_pos = mouse - offset
    LDI r20, DRAG_OX
    LOAD r8, r20
    LDI r20, DRAG_OY
    LOAD r7, r20
    SUB r15, r8
    SUB r6, r7
    ; WINSYS MOVETO (op=5): r11=win_id, r4=new_x, r10=new_y
    LDI r14, 5
    LDI r11, DRAG_WIN
    LOAD r11, r11
    WINSYS r14
    JMP hm_done

hm_clear_drag:
    LDI r20, DRAG_WIN
    LDI r11, 0
    STORE r20, r11

hm_done:
    POP r31
    RET

; =========================================
; DRAIN_PTY -- render PTY output as pixel bars
; =========================================
drain_pty:
    PUSH r31
    LDI r4, 1

    ; Check terminal window exists
    LDI r20, TERM_WIN
    LOAD r11, r20
    CMPI r11, 0
    JZ r11, dp_done

    ; Check PTY is valid
    LDI r20, PTY_HANDLE
    LOAD r11, r20
    CMPI r11, 0xFFFF
    JZ r11, dp_done

    ; Read from PTY (max 16 bytes per frame to stay responsive)
    LDI r6, PTY_RECV
    LDI r12, 16
    PTYREAD r28, r6, r12
    MOV r8, r11
    ; 0 = no data, 0xFFFFFFFF = PTY closed -> skip
    CMPI r8, 0
    JZ r11, dp_done
    CMPI r8, 0
    ; r8 != 0 here. Check for error (0xFFFFFFFF = -1 = all bits set)
    ; Use AND to check: if r8 == 0xFFFFFFFF, AND with itself stays same
    ; Simpler: just check if r8 > 4096 (our max read)
    LDI r11, 4097
    CMP r8, r11
    BGE r11, dp_done

    LDI r7, 0

dp_loop:
    CMP r7, r8
    BGE r11, dp_done

    ; Load byte
    LDI r20, PTY_RECV
    ADD r20, r7
    LOAD r15, r20

    ; --- ANSI escape stripping (two-state) ---
    ; State 0 = normal, State 1 = saw ESC, State 2 = saw ESC[ (CSI)
    ; Check if we're in an escape sequence
    LDI r20, ANSI_ESCAPE
    LOAD r11, r20
    CMPI r11, 0
    JNZ r11, dp_in_escape

    ; State 0: normal mode, check for ESC
dp_check_esc:
    CMPI r15, 27
    JNZ r11, dp_normal
    ; Saw ESC -> state 1
    LDI r20, ANSI_ESCAPE
    LDI r11, 1
    STORE r20, r11
    JMP dp_next

dp_in_escape:
    ; State 1 or 2
    CMPI r11, 2
    JZ r11, dp_csi_mode

    ; State 1: saw ESC, check for CSI introducer '['
    CMPI r15, 0x5B
    JZ r11, dp_enter_csi
    ; Not '[', check for single-char escape terminator (0x40-0x7E)
    CMPI r15, 0x40
    BLT r11, dp_next
    CMPI r15, 0x7F
    BGE r11, dp_next
    ; Terminator found (e.g. ESC M), clear state
    LDI r20, ANSI_ESCAPE
    LDI r11, 0
    STORE r20, r11
    JMP dp_next

dp_enter_csi:
    ; Saw ESC[, enter CSI mode (state 2)
    LDI r20, ANSI_ESCAPE
    LDI r11, 2
    STORE r20, r11
    JMP dp_next

dp_csi_mode:
    ; State 2: in CSI sequence, skip params until final byte (0x40-0x7E)
    CMPI r15, 0x40
    BLT r11, dp_next
    CMPI r15, 0x7F
    BGE r11, dp_next
    ; Final byte found, clear escape state
    LDI r20, ANSI_ESCAPE
    LDI r11, 0
    STORE r20, r11
    JMP dp_next

dp_normal:
    ; Newline?
    CMPI r15, 10
    JZ r11, dp_newline

    ; Carriage return?
    CMPI r15, 13
    JZ r11, dp_next

    ; Skip non-printable (< 32)
    CMPI r15, 32
    BLT r11, dp_next

    ; Skip DEL and above (> 126)
    CMPI r15, 127
    BGE r11, dp_next

    ; Printable! Draw vertical bar: height = byte - 30, cap at 80
    SUB r15, r4
    SUB r15, r4
    LDI r12, 80
    CMP r15, r12
    BLT r11, dp_height_ok
    MOV r15, r12

dp_height_ok:
    ; Read cursor position
    LDI r20, TERM_CUR_X
    LOAD r3, r20
    LDI r20, TERM_CUR_Y
    LOAD r1, r20

    ; Check if we've gone past window width (180)
    CMPI r3, 170
    BGE r11, dp_newline

    ; Draw bar pixels -- save r4 (used as constant 1)
    MOV r18, r4
    LDI r5, 0

dp_bar:
    CMP r5, r15
    BGE r11, dp_after_bar

    ; WPIXEL win_id, x, y, color
    LDI r11, TERM_WIN
    LOAD r11, r11
    MOV r4, r3
    MOV r10, r1
    ADD r10, r5
    ; Color: bright green
    LDI r14, 0x22CC22
    WPIXEL r11, r4, r10, r14

    ADD r5, r18
    LDI r4, 1
    JMP dp_bar

dp_after_bar:
    ; Advance x cursor
    LDI r20, TERM_CUR_X
    LOAD r11, r20
    ADD r11, r4
    STORE r20, r11
    JMP dp_next

dp_newline:
    ; Reset x, advance y
    LDI r20, TERM_CUR_X
    LDI r11, 0
    STORE r20, r11
    LDI r20, TERM_CUR_Y
    LOAD r11, r20
    ADD r11, r4
    STORE r20, r11

dp_next:
    ADD r7, r4
    LDI r4, 1
    JMP dp_loop

dp_done:
    POP r31
    RET

; =========================================
; UPDATE_SYSMON
; =========================================
update_sysmon:
    PUSH r31
    LDI r4, 1

    ; Check window exists
    LDI r20, SYSMON_WIN
    LOAD r11, r20
    CMPI r11, 0
    JZ r11, us_done

    ; Check dirty flag
    LDI r20, DIRTY_SYSMON
    LOAD r11, r20
    CMPI r11, 0
    JZ r11, us_done

    ; Clear dirty
    LDI r20, DIRTY_SYSMON
    LDI r11, 0
    STORE r20, r11

    ; Heartbeat bar (frame % 50), cyan, at y=2
    LDI r20, FRAME_COUNT
    LOAD r15, r20
    LDI r6, 50
    MOD r15, r6
    LDI r1, 0

us_bar:
    CMP r1, r15
    BGE r11, us_dots
    LDI r11, SYSMON_WIN
    LOAD r11, r11
    MOV r4, r1
    LDI r10, 2
    LDI r14, COL_CYAN
    WPIXEL r11, r4, r10, r14
    LDI r4, 1
    ADD r1, r4
    JMP us_bar

us_dots:
    ; Dot row (frame % 16), yellow, at y=8
    LDI r20, FRAME_COUNT
    LOAD r15, r20
    LDI r6, 16
    MOD r15, r6
    LDI r1, 0

us_dot_loop:
    CMP r1, r15
    BGE r11, us_draw_text
    LDI r11, SYSMON_WIN
    LOAD r11, r11
    MOV r4, r1
    LDI r10, 8
    LDI r14, COL_YELLOW
    WPIXEL r11, r4, r10, r14
    LDI r4, 1
    ADD r1, r4
    JMP us_dot_loop

us_draw_text:
    ; "GEOS" pixel art at (5, 25)
    LDI r13, 5
    LDI r16, 25
    CALL pxl_G
    ADD r13, r4
    ADD r13, r4
    ADD r13, r4
    ADD r13, r4
    CALL pxl_E
    ADD r13, r4
    ADD r13, r4
    ADD r13, r4
    ADD r13, r4
    CALL pxl_O
    ADD r13, r4
    ADD r13, r4
    ADD r13, r4
    ADD r13, r4
    CALL pxl_S

    ; Redirty every 30 frames
    LDI r20, BLINK_COUNT
    LOAD r11, r20
    LDI r6, 30
    MOD r11, r6
    CMPI r11, 0
    JNZ r11, us_done
    LDI r20, DIRTY_SYSMON
    LDI r11, 1
    STORE r20, r11

us_done:
    POP r31
    RET

; =========================================
; UPDATE_TASKBAR -- activity bar
; =========================================
update_taskbar:
    PUSH r31
    LDI r4, 1

    ; Only every 10 frames
    LDI r20, FRAME_COUNT
    LOAD r11, r20
    LDI r6, 10
    MOD r11, r6
    CMPI r11, 0
    JNZ r11, ut_done

    ; Bar width = frame % 100 at y=249
    LDI r20, FRAME_COUNT
    LOAD r15, r20
    LDI r6, 100
    MOD r15, r6
    ; Save loop limit in r18 (r15 will be clobbered by color LDI)
    MOV r18, r15
    LDI r1, 0

ut_bar:
    CMP r1, r18
    BGE r11, ut_done
    MOV r4, r1
    LDI r10, 249
    LDI r14, 1
    LDI r2, 5
    LDI r15, 0x444466
    RECTF r4, r10, r14, r2, r15
    LDI r4, 1
    ADD r1, r4
    JMP ut_bar

ut_done:
    POP r31
    RET

; =========================================
; PIXEL LETTER ROUTINES (3x5 each)
; Draw at (r13, r16) in sysmon window, green
; =========================================

pxl_G:
    PUSH r31
    LDI r4, 1
    LDI r11, SYSMON_WIN
    LOAD r11, r11
    LDI r14, COL_GREEN
    MOV r4, r13
    MOV r10, r16
    WPIXEL r11, r4, r10, r14
    ADD r13, r4
    WPIXEL r11, r13, r10, r14
    ADD r13, r4
    WPIXEL r11, r13, r10, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    SUB r13, r4
    SUB r13, r4
    SUB r16, r4
    SUB r16, r4
    SUB r16, r4
    SUB r16, r4
    POP r31
    RET

pxl_E:
    PUSH r31
    LDI r4, 1
    LDI r11, SYSMON_WIN
    LOAD r11, r11
    LDI r14, COL_GREEN
    MOV r4, r13
    MOV r10, r16
    WPIXEL r11, r4, r10, r14
    ADD r13, r4
    WPIXEL r11, r13, r10, r14
    ADD r13, r4
    WPIXEL r11, r13, r10, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    SUB r13, r4
    SUB r13, r4
    SUB r16, r4
    SUB r16, r4
    SUB r16, r4
    SUB r16, r4
    POP r31
    RET

pxl_O:
    PUSH r31
    LDI r4, 1
    LDI r11, SYSMON_WIN
    LOAD r11, r11
    LDI r14, COL_GREEN
    MOV r4, r13
    MOV r10, r16
    WPIXEL r11, r4, r10, r14
    ADD r13, r4
    WPIXEL r11, r13, r10, r14
    ADD r13, r4
    WPIXEL r11, r13, r10, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    SUB r13, r4
    SUB r13, r4
    SUB r16, r4
    SUB r16, r4
    SUB r16, r4
    SUB r16, r4
    POP r31
    RET

pxl_S:
    PUSH r31
    LDI r4, 1
    LDI r11, SYSMON_WIN
    LOAD r11, r11
    LDI r14, COL_GREEN
    MOV r4, r13
    MOV r10, r16
    ADD r13, r4
    WPIXEL r11, r13, r10, r14
    ADD r13, r4
    WPIXEL r11, r13, r10, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r16, r4
    SUB r13, r4
    SUB r13, r4
    WPIXEL r11, r13, r16, r14
    ADD r13, r4
    WPIXEL r11, r13, r16, r14
    SUB r13, r4
    SUB r16, r4
    SUB r16, r4
    SUB r16, r4
    SUB r16, r4
    POP r31
    RET
