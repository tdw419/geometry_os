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

LDI r8, 1
LDI r30, 0xFD00

; Clear screen
LDI r4, 0x0A0A0A
FILL r4

; Desktop background (256 x 240)
LDI r8, 0
LDI r14, 0
LDI r0, 256
LDI r5, 240
LDI r12, COL_DESKTOP
RECTF r8, r14, r0, r5, r12

; Taskbar (256 x 16)
LDI r8, 0
LDI r14, 240
LDI r0, 256
LDI r5, 16
LDI r12, COL_TASKBAR
RECTF r8, r14, r0, r5, r12

; Taskbar label
LDI r20, TEMP_AREA
STRO r20, "Geometry OS"
LDI r8, 4
LDI r14, 243
LDI r0, TEMP_AREA
LDI r5, COL_GREEN
LDI r12, COL_TASKBAR
SMALLTEXT r8, r14, r0, r5, r12

; Init all variables to 0
LDI r20, TERM_WIN
LDI r4, 0
STORE r20, r4
LDI r20, SYSMON_WIN
STORE r20, r4
LDI r20, FOCUSED_WIN
STORE r20, r4
LDI r20, FRAME_COUNT
STORE r20, r4
LDI r20, DRAG_WIN
STORE r20, r4
LDI r20, BLINK_COUNT
STORE r20, r4
LDI r20, TERM_CUR_X
LDI r4, 0
STORE r20, r4
LDI r20, TERM_CUR_Y
LDI r4, 0
STORE r20, r4

; ANSI escape state: 0 = normal, 1 = in escape sequence
LDI r20, ANSI_ESCAPE
LDI r4, 0
STORE r20, r4

; PTY handle init to invalid
LDI r20, PTY_HANDLE
LDI r4, 0xFFFF
STORE r20, r4

; Dirty sysmon = start dirty
LDI r20, DIRTY_SYSMON
LDI r4, 1
STORE r20, r4

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
LDI r8, 4
LDI r14, 6
LDI r0, 180
LDI r5, 168
LDI r12, TITLE_TERM
LDI r4, 0
WINSYS r4
; r4 = window_id
LDI r20, TERM_WIN
STORE r20, r4

; Monitor: x=192, y=6, w=60, h=100
LDI r8, 192
LDI r14, 6
LDI r0, 60
LDI r5, 100
LDI r12, TITLE_MON
LDI r4, 0
WINSYS r4
; r4 = window_id
LDI r20, SYSMON_WIN
STORE r20, r4

; Focus terminal by default
LDI r20, FOCUSED_WIN
LDI r4, TERM_WIN
LOAD r4, r4
STORE r20, r4

; =========================================
; OPEN PTY FOR TERMINAL
; =========================================

; Null-terminate send buffer
LDI r20, PTY_SEND
LDI r4, 0
STORE r20, r4

; Open PTY: PTYOPEN cmd_addr_reg, handle_reg
LDI r12, PTY_SEND
PTYOPEN r12, r6
; r6 = slot index (handle), r4 = status

; Store handle
LDI r20, PTY_HANDLE
STORE r20, r6

; Also keep a copy in r28 for PTYWRITE/PTYREAD
LDI r28, 0
ADD r28, r6

; Set PTY size 24x80
LDI r10, 24
LDI r9, 80
PTYSIZE r28, r10, r9

; Send "clear" to PTY
LDI r20, PTY_SEND
STRO r20, "clear\n"
LDI r15, PTY_SEND
LDI r3, 6
PTYWRITE r28, r15, r3

LDI r8, 1

; =========================================
; MAIN LOOP
; =========================================

main_loop:
    LDI r8, 1

    CALL handle_mouse
    CALL drain_pty
    CALL update_sysmon
    CALL update_taskbar

    ; Increment counters
    LDI r20, BLINK_COUNT
    LOAD r4, r20
    ADD r4, r8
    STORE r20, r4

    LDI r20, FRAME_COUNT
    LOAD r4, r20
    ADD r4, r8
    STORE r20, r4

    FRAME

    ; Keyboard -> PTY if terminal focused
    IKEY r12
    JZ r12, main_loop

    LDI r20, FOCUSED_WIN
    LOAD r4, r20
    LDI r20, TERM_WIN
    LOAD r20, r20
    CMP r4, r20
    JNZ r4, main_loop

    ; Forward key to PTY
    LDI r20, PTY_SEND
    STORE r20, r12
    LDI r15, PTY_SEND
    LDI r3, 1
    PTYWRITE r28, r15, r3
    JMP main_loop

; =========================================
; HANDLE_MOUSE
; =========================================
handle_mouse:
    PUSH r31
    LDI r8, 1

    MOUSEQ r12
    ; r12=mx, r15=my, r3=btn

    ; Click (btn==2)
    CMPI r3, 2
    JNZ r4, hm_check_drag

    ; WINSYS HITTEST (op=4): r4=win_id, r8=hit_type
    LDI r4, 4
    WINSYS r4
    CMPI r4, 0
    JZ r4, hm_clear_drag

    ; hit_type 3 = close button
    CMPI r8, 3
    JNZ r4, hm_check_title
    ; Destroy window
    LDI r4, 1
    WINSYS r4
    ; Clear focus if we closed the focused window
    LDI r20, FOCUSED_WIN
    LDI r4, 0
    STORE r20, r4
    JMP hm_done

hm_check_title:
    ; hit_type 1 = title bar
    CMPI r8, 1
    JNZ r4, hm_check_body

    ; Focus + bring to front
    LDI r20, FOCUSED_WIN
    STORE r20, r4
    LDI r4, 2
    WINSYS r4

    ; Start drag: save win_id and mouse offset
    LDI r20, DRAG_WIN
    LDI r4, FOCUSED_WIN
    LOAD r4, r4
    STORE r20, r4

    ; Get window position via WINFO (op=6)
    LDI r4, 6
    LDI r8, TEMP_AREA
    WINSYS r4
    ; TEMP_AREA[0]=x, TEMP_AREA[1]=y
    LDI r20, TEMP_AREA
    LOAD r13, r20
    ADD r20, r8
    LOAD r1, r20
    SUB r13, r12
    SUB r1, r15
    LDI r20, DRAG_OX
    STORE r20, r13
    LDI r20, DRAG_OY
    STORE r20, r1
    JMP hm_done

hm_check_body:
    ; hit_type 2 = body -> focus only
    LDI r20, FOCUSED_WIN
    STORE r20, r4
    LDI r4, 2
    WINSYS r4
    JMP hm_done

hm_check_drag:
    ; btn==1 (held down) -> drag if active
    CMPI r3, 1
    JNZ r4, hm_clear_drag

    LDI r20, DRAG_WIN
    LOAD r4, r20
    CMPI r4, 0
    JZ r4, hm_clear_drag

    ; Move window: new_pos = mouse - offset
    LDI r20, DRAG_OX
    LOAD r13, r20
    LDI r20, DRAG_OY
    LOAD r1, r20
    SUB r12, r13
    SUB r15, r1
    ; WINSYS MOVETO (op=5): r4=win_id, r8=new_x, r14=new_y
    LDI r0, 5
    LDI r4, DRAG_WIN
    LOAD r4, r4
    WINSYS r0
    JMP hm_done

hm_clear_drag:
    LDI r20, DRAG_WIN
    LDI r4, 0
    STORE r20, r4

hm_done:
    POP r31
    RET

; =========================================
; DRAIN_PTY -- render PTY output as pixel bars
; =========================================
drain_pty:
    PUSH r31
    LDI r8, 1

    ; Check terminal window exists
    LDI r20, TERM_WIN
    LOAD r4, r20
    CMPI r4, 0
    JZ r4, dp_done

    ; Check PTY is valid
    LDI r20, PTY_HANDLE
    LOAD r4, r20
    CMPI r4, 0xFFFF
    JZ r4, dp_done

    ; Read from PTY (max 16 bytes per frame to stay responsive)
    LDI r15, PTY_RECV
    LDI r3, 16
    PTYREAD r28, r15, r3
    MOV r13, r4
    ; 0 = no data, 0xFFFFFFFF = PTY closed -> skip
    CMPI r13, 0
    JZ r4, dp_done
    CMPI r13, 0
    ; r13 != 0 here. Check for error (0xFFFFFFFF = -1 = all bits set)
    ; Use AND to check: if r13 == 0xFFFFFFFF, AND with itself stays same
    ; Simpler: just check if r13 > 4096 (our max read)
    LDI r4, 4097
    CMP r13, r4
    BGE r4, dp_done

    LDI r1, 0

dp_loop:
    CMP r1, r13
    BGE r4, dp_done

    ; Load byte
    LDI r20, PTY_RECV
    ADD r20, r1
    LOAD r12, r20

    ; --- ANSI escape stripping (two-state) ---
    ; State 0 = normal, State 1 = saw ESC, State 2 = saw ESC[ (CSI)
    ; Check if we're in an escape sequence
    LDI r20, ANSI_ESCAPE
    LOAD r4, r20
    CMPI r4, 0
    JNZ r4, dp_in_escape

    ; State 0: normal mode, check for ESC
dp_check_esc:
    CMPI r12, 27
    JNZ r4, dp_normal
    ; Saw ESC -> state 1
    LDI r20, ANSI_ESCAPE
    LDI r4, 1
    STORE r20, r4
    JMP dp_next

dp_in_escape:
    ; State 1 or 2
    CMPI r4, 2
    JZ r4, dp_csi_mode

    ; State 1: saw ESC, check for CSI introducer '['
    CMPI r12, 0x5B
    JZ r4, dp_enter_csi
    ; Not '[', check for single-char escape terminator (0x40-0x7E)
    CMPI r12, 0x40
    BLT r4, dp_next
    CMPI r12, 0x7F
    BGE r4, dp_next
    ; Terminator found (e.g. ESC M), clear state
    LDI r20, ANSI_ESCAPE
    LDI r4, 0
    STORE r20, r4
    JMP dp_next

dp_enter_csi:
    ; Saw ESC[, enter CSI mode (state 2)
    LDI r20, ANSI_ESCAPE
    LDI r4, 2
    STORE r20, r4
    JMP dp_next

dp_csi_mode:
    ; State 2: in CSI sequence, skip params until final byte (0x40-0x7E)
    CMPI r12, 0x40
    BLT r4, dp_next
    CMPI r12, 0x7F
    BGE r4, dp_next
    ; Final byte found, clear escape state
    LDI r20, ANSI_ESCAPE
    LDI r4, 0
    STORE r20, r4
    JMP dp_next

dp_normal:
    ; Newline?
    CMPI r12, 10
    JZ r4, dp_newline

    ; Carriage return?
    CMPI r12, 13
    JZ r4, dp_next

    ; Skip non-printable (< 32)
    CMPI r12, 32
    BLT r4, dp_next

    ; Skip DEL and above (> 126)
    CMPI r12, 127
    BGE r4, dp_next

    ; Printable! Draw vertical bar: height = byte - 30, cap at 80
    SUB r12, r8
    SUB r12, r8
    LDI r3, 80
    CMP r12, r3
    BLT r4, dp_height_ok
    MOV r12, r3

dp_height_ok:
    ; Read cursor position
    LDI r20, TERM_CUR_X
    LOAD r6, r20
    LDI r20, TERM_CUR_Y
    LOAD r10, r20

    ; Check if we've gone past window width (180)
    CMPI r6, 170
    BGE r4, dp_newline

    ; Draw bar pixels -- save r8 (used as constant 1)
    MOV r18, r8
    LDI r9, 0

dp_bar:
    CMP r9, r12
    BGE r4, dp_after_bar

    ; WPIXEL win_id, x, y, color
    LDI r4, TERM_WIN
    LOAD r4, r4
    MOV r8, r6
    MOV r14, r10
    ADD r14, r9
    ; Color: bright green
    LDI r0, 0x22CC22
    WPIXEL r4, r8, r14, r0

    ADD r9, r18
    LDI r8, 1
    JMP dp_bar

dp_after_bar:
    ; Advance x cursor
    LDI r20, TERM_CUR_X
    LOAD r4, r20
    ADD r4, r8
    STORE r20, r4
    JMP dp_next

dp_newline:
    ; Reset x, advance y
    LDI r20, TERM_CUR_X
    LDI r4, 0
    STORE r20, r4
    LDI r20, TERM_CUR_Y
    LOAD r4, r20
    ADD r4, r8
    STORE r20, r4

dp_next:
    ADD r1, r8
    LDI r8, 1
    JMP dp_loop

dp_done:
    POP r31
    RET

; =========================================
; UPDATE_SYSMON
; =========================================
update_sysmon:
    PUSH r31
    LDI r8, 1

    ; Check window exists
    LDI r20, SYSMON_WIN
    LOAD r4, r20
    CMPI r4, 0
    JZ r4, us_done

    ; Check dirty flag
    LDI r20, DIRTY_SYSMON
    LOAD r4, r20
    CMPI r4, 0
    JZ r4, us_done

    ; Clear dirty
    LDI r20, DIRTY_SYSMON
    LDI r4, 0
    STORE r20, r4

    ; Heartbeat bar (frame % 50), cyan, at y=2
    LDI r20, FRAME_COUNT
    LOAD r12, r20
    LDI r15, 50
    MOD r12, r15
    LDI r10, 0

us_bar:
    CMP r10, r12
    BGE r4, us_dots
    LDI r4, SYSMON_WIN
    LOAD r4, r4
    MOV r8, r10
    LDI r14, 2
    LDI r0, COL_CYAN
    WPIXEL r4, r8, r14, r0
    LDI r8, 1
    ADD r10, r8
    JMP us_bar

us_dots:
    ; Dot row (frame % 16), yellow, at y=8
    LDI r20, FRAME_COUNT
    LOAD r12, r20
    LDI r15, 16
    MOD r12, r15
    LDI r10, 0

us_dot_loop:
    CMP r10, r12
    BGE r4, us_draw_text
    LDI r4, SYSMON_WIN
    LOAD r4, r4
    MOV r8, r10
    LDI r14, 8
    LDI r0, COL_YELLOW
    WPIXEL r4, r8, r14, r0
    LDI r8, 1
    ADD r10, r8
    JMP us_dot_loop

us_draw_text:
    ; "GEOS" pixel art at (5, 25)
    LDI r2, 5
    LDI r16, 25
    CALL pxl_G
    ADD r2, r8
    ADD r2, r8
    ADD r2, r8
    ADD r2, r8
    CALL pxl_E
    ADD r2, r8
    ADD r2, r8
    ADD r2, r8
    ADD r2, r8
    CALL pxl_O
    ADD r2, r8
    ADD r2, r8
    ADD r2, r8
    ADD r2, r8
    CALL pxl_S

    ; Redirty every 30 frames
    LDI r20, BLINK_COUNT
    LOAD r4, r20
    LDI r15, 30
    MOD r4, r15
    CMPI r4, 0
    JNZ r4, us_done
    LDI r20, DIRTY_SYSMON
    LDI r4, 1
    STORE r20, r4

us_done:
    POP r31
    RET

; =========================================
; UPDATE_TASKBAR -- activity bar
; =========================================
update_taskbar:
    PUSH r31
    LDI r8, 1

    ; Only every 10 frames
    LDI r20, FRAME_COUNT
    LOAD r4, r20
    LDI r15, 10
    MOD r4, r15
    CMPI r4, 0
    JNZ r4, ut_done

    ; Bar width = frame % 100 at y=249
    LDI r20, FRAME_COUNT
    LOAD r12, r20
    LDI r15, 100
    MOD r12, r15
    ; Save loop limit in r18 (r12 will be clobbered by color LDI)
    MOV r18, r12
    LDI r10, 0

ut_bar:
    CMP r10, r18
    BGE r4, ut_done
    MOV r8, r10
    LDI r14, 249
    LDI r0, 1
    LDI r5, 5
    LDI r12, 0x444466
    RECTF r8, r14, r0, r5, r12
    LDI r8, 1
    ADD r10, r8
    JMP ut_bar

ut_done:
    POP r31
    RET

; =========================================
; PIXEL LETTER ROUTINES (3x5 each)
; Draw at (r2, r16) in sysmon window, green
; =========================================

pxl_G:
    PUSH r31
    LDI r8, 1
    LDI r4, SYSMON_WIN
    LOAD r4, r4
    LDI r0, COL_GREEN
    MOV r8, r2
    MOV r14, r16
    WPIXEL r4, r8, r14, r0
    ADD r2, r8
    WPIXEL r4, r2, r14, r0
    ADD r2, r8
    WPIXEL r4, r2, r14, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    SUB r2, r8
    SUB r2, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    POP r31
    RET

pxl_E:
    PUSH r31
    LDI r8, 1
    LDI r4, SYSMON_WIN
    LOAD r4, r4
    LDI r0, COL_GREEN
    MOV r8, r2
    MOV r14, r16
    WPIXEL r4, r8, r14, r0
    ADD r2, r8
    WPIXEL r4, r2, r14, r0
    ADD r2, r8
    WPIXEL r4, r2, r14, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    SUB r2, r8
    SUB r2, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    POP r31
    RET

pxl_O:
    PUSH r31
    LDI r8, 1
    LDI r4, SYSMON_WIN
    LOAD r4, r4
    LDI r0, COL_GREEN
    MOV r8, r2
    MOV r14, r16
    WPIXEL r4, r8, r14, r0
    ADD r2, r8
    WPIXEL r4, r2, r14, r0
    ADD r2, r8
    WPIXEL r4, r2, r14, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    SUB r2, r8
    SUB r2, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    POP r31
    RET

pxl_S:
    PUSH r31
    LDI r8, 1
    LDI r4, SYSMON_WIN
    LOAD r4, r4
    LDI r0, COL_GREEN
    MOV r8, r2
    MOV r14, r16
    ADD r2, r8
    WPIXEL r4, r2, r14, r0
    ADD r2, r8
    WPIXEL r4, r2, r14, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r16, r8
    SUB r2, r8
    SUB r2, r8
    WPIXEL r4, r2, r16, r0
    ADD r2, r8
    WPIXEL r4, r2, r16, r0
    SUB r2, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    POP r31
    RET
