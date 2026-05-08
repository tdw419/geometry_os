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

LDI r10, 1
LDI r30, 0xFD00

; Clear screen
LDI r0, 0x0A0A0A
FILL r0

; Desktop background (256 x 240)
LDI r10, 0
LDI r7, 0
LDI r6, 256
LDI r5, 240
LDI r12, COL_DESKTOP
RECTF r10, r7, r6, r5, r12

; Taskbar (256 x 16)
LDI r10, 0
LDI r7, 240
LDI r6, 256
LDI r5, 16
LDI r12, COL_TASKBAR
RECTF r10, r7, r6, r5, r12

; Taskbar label
LDI r20, TEMP_AREA
STRO r20, "Geometry OS"
LDI r10, 4
LDI r7, 243
LDI r6, TEMP_AREA
LDI r5, COL_GREEN
LDI r12, COL_TASKBAR
SMALLTEXT r10, r7, r6, r5, r12

; Init all variables to 0
LDI r20, TERM_WIN
LDI r0, 0
STORE r20, r0
LDI r20, SYSMON_WIN
STORE r20, r0
LDI r20, FOCUSED_WIN
STORE r20, r0
LDI r20, FRAME_COUNT
STORE r20, r0
LDI r20, DRAG_WIN
STORE r20, r0
LDI r20, BLINK_COUNT
STORE r20, r0
LDI r20, TERM_CUR_X
LDI r0, 0
STORE r20, r0
LDI r20, TERM_CUR_Y
LDI r0, 0
STORE r20, r0

; ANSI escape state: 0 = normal, 1 = in escape sequence
LDI r20, ANSI_ESCAPE
LDI r0, 0
STORE r20, r0

; PTY handle init to invalid
LDI r20, PTY_HANDLE
LDI r0, 0xFFFF
STORE r20, r0

; Dirty sysmon = start dirty
LDI r20, DIRTY_SYSMON
LDI r0, 1
STORE r20, r0

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
LDI r10, 4
LDI r7, 6
LDI r6, 180
LDI r5, 168
LDI r12, TITLE_TERM
LDI r0, 0
WINSYS r0
; r0 = window_id
LDI r20, TERM_WIN
STORE r20, r0

; Monitor: x=192, y=6, w=60, h=100
LDI r10, 192
LDI r7, 6
LDI r6, 60
LDI r5, 100
LDI r12, TITLE_MON
LDI r0, 0
WINSYS r0
; r0 = window_id
LDI r20, SYSMON_WIN
STORE r20, r0

; Focus terminal by default
LDI r20, FOCUSED_WIN
LDI r0, TERM_WIN
LOAD r0, r0
STORE r20, r0

; =========================================
; OPEN PTY FOR TERMINAL
; =========================================

; Null-terminate send buffer
LDI r20, PTY_SEND
LDI r0, 0
STORE r20, r0

; Open PTY: PTYOPEN cmd_addr_reg, handle_reg
LDI r12, PTY_SEND
PTYOPEN r12, r1
; r1 = slot index (handle), r0 = status

; Store handle
LDI r20, PTY_HANDLE
STORE r20, r1

; Also keep a copy in r28 for PTYWRITE/PTYREAD
LDI r28, 0
ADD r28, r1

; Set PTY size 24x80
LDI r11, 24
LDI r4, 80
PTYSIZE r28, r11, r4

; Send "clear" to PTY
LDI r20, PTY_SEND
STRO r20, "clear\n"
LDI r8, PTY_SEND
LDI r14, 6
PTYWRITE r28, r8, r14

LDI r10, 1

; =========================================
; MAIN LOOP
; =========================================

main_loop:
    LDI r10, 1

    CALL handle_mouse
    CALL drain_pty
    CALL update_sysmon
    CALL update_taskbar

    ; Increment counters
    LDI r20, BLINK_COUNT
    LOAD r0, r20
    ADD r0, r10
    STORE r20, r0

    LDI r20, FRAME_COUNT
    LOAD r0, r20
    ADD r0, r10
    STORE r20, r0

    FRAME

    ; Keyboard -> PTY if terminal focused
    IKEY r12
    JZ r12, main_loop

    LDI r20, FOCUSED_WIN
    LOAD r0, r20
    LDI r20, TERM_WIN
    LOAD r20, r20
    CMP r0, r20
    JNZ r0, main_loop

    ; Forward key to PTY
    LDI r20, PTY_SEND
    STORE r20, r12
    LDI r8, PTY_SEND
    LDI r14, 1
    PTYWRITE r28, r8, r14
    JMP main_loop

; =========================================
; HANDLE_MOUSE
; =========================================
handle_mouse:
    PUSH r31
    LDI r10, 1

    MOUSEQ r12
    ; r12=mx, r8=my, r14=btn

    ; Click (btn==2)
    CMPI r14, 2
    JNZ r0, hm_check_drag

    ; WINSYS HITTEST (op=4): r0=win_id, r10=hit_type
    LDI r0, 4
    WINSYS r0
    CMPI r0, 0
    JZ r0, hm_clear_drag

    ; hit_type 3 = close button
    CMPI r10, 3
    JNZ r0, hm_check_title
    ; Destroy window
    LDI r0, 1
    WINSYS r0
    ; Clear focus if we closed the focused window
    LDI r20, FOCUSED_WIN
    LDI r0, 0
    STORE r20, r0
    JMP hm_done

hm_check_title:
    ; hit_type 1 = title bar
    CMPI r10, 1
    JNZ r0, hm_check_body

    ; Focus + bring to front
    LDI r20, FOCUSED_WIN
    STORE r20, r0
    LDI r0, 2
    WINSYS r0

    ; Start drag: save win_id and mouse offset
    LDI r20, DRAG_WIN
    LDI r0, FOCUSED_WIN
    LOAD r0, r0
    STORE r20, r0

    ; Get window position via WINFO (op=6)
    LDI r0, 6
    LDI r10, TEMP_AREA
    WINSYS r0
    ; TEMP_AREA[0]=x, TEMP_AREA[1]=y
    LDI r20, TEMP_AREA
    LOAD r3, r20
    ADD r20, r10
    LOAD r2, r20
    SUB r3, r12
    SUB r2, r8
    LDI r20, DRAG_OX
    STORE r20, r3
    LDI r20, DRAG_OY
    STORE r20, r2
    JMP hm_done

hm_check_body:
    ; hit_type 2 = body -> focus only
    LDI r20, FOCUSED_WIN
    STORE r20, r0
    LDI r0, 2
    WINSYS r0
    JMP hm_done

hm_check_drag:
    ; btn==1 (held down) -> drag if active
    CMPI r14, 1
    JNZ r0, hm_clear_drag

    LDI r20, DRAG_WIN
    LOAD r0, r20
    CMPI r0, 0
    JZ r0, hm_clear_drag

    ; Move window: new_pos = mouse - offset
    LDI r20, DRAG_OX
    LOAD r3, r20
    LDI r20, DRAG_OY
    LOAD r2, r20
    SUB r12, r3
    SUB r8, r2
    ; WINSYS MOVETO (op=5): r0=win_id, r10=new_x, r7=new_y
    LDI r6, 5
    LDI r0, DRAG_WIN
    LOAD r0, r0
    WINSYS r6
    JMP hm_done

hm_clear_drag:
    LDI r20, DRAG_WIN
    LDI r0, 0
    STORE r20, r0

hm_done:
    POP r31
    RET

; =========================================
; DRAIN_PTY -- render PTY output as pixel bars
; =========================================
drain_pty:
    PUSH r31
    LDI r10, 1

    ; Check terminal window exists
    LDI r20, TERM_WIN
    LOAD r0, r20
    CMPI r0, 0
    JZ r0, dp_done

    ; Check PTY is valid
    LDI r20, PTY_HANDLE
    LOAD r0, r20
    CMPI r0, 0xFFFF
    JZ r0, dp_done

    ; Read from PTY (max 16 bytes per frame to stay responsive)
    LDI r8, PTY_RECV
    LDI r14, 16
    PTYREAD r28, r8, r14
    MOV r3, r0
    ; 0 = no data, 0xFFFFFFFF = PTY closed -> skip
    CMPI r3, 0
    JZ r0, dp_done
    CMPI r3, 0
    ; r3 != 0 here. Check for error (0xFFFFFFFF = -1 = all bits set)
    ; Use AND to check: if r3 == 0xFFFFFFFF, AND with itself stays same
    ; Simpler: just check if r3 > 4096 (our max read)
    LDI r0, 4097
    CMP r3, r0
    BGE r0, dp_done

    LDI r2, 0

dp_loop:
    CMP r2, r3
    BGE r0, dp_done

    ; Load byte
    LDI r20, PTY_RECV
    ADD r20, r2
    LOAD r12, r20

    ; --- ANSI escape stripping (two-state) ---
    ; State 0 = normal, State 1 = saw ESC, State 2 = saw ESC[ (CSI)
    ; Check if we're in an escape sequence
    LDI r20, ANSI_ESCAPE
    LOAD r0, r20
    CMPI r0, 0
    JNZ r0, dp_in_escape

    ; State 0: normal mode, check for ESC
dp_check_esc:
    CMPI r12, 27
    JNZ r0, dp_normal
    ; Saw ESC -> state 1
    LDI r20, ANSI_ESCAPE
    LDI r0, 1
    STORE r20, r0
    JMP dp_next

dp_in_escape:
    ; State 1 or 2
    CMPI r0, 2
    JZ r0, dp_csi_mode

    ; State 1: saw ESC, check for CSI introducer '['
    CMPI r12, 0x5B
    JZ r0, dp_enter_csi
    ; Not '[', check for single-char escape terminator (0x40-0x7E)
    CMPI r12, 0x40
    BLT r0, dp_next
    CMPI r12, 0x7F
    BGE r0, dp_next
    ; Terminator found (e.g. ESC M), clear state
    LDI r20, ANSI_ESCAPE
    LDI r0, 0
    STORE r20, r0
    JMP dp_next

dp_enter_csi:
    ; Saw ESC[, enter CSI mode (state 2)
    LDI r20, ANSI_ESCAPE
    LDI r0, 2
    STORE r20, r0
    JMP dp_next

dp_csi_mode:
    ; State 2: in CSI sequence, skip params until final byte (0x40-0x7E)
    CMPI r12, 0x40
    BLT r0, dp_next
    CMPI r12, 0x7F
    BGE r0, dp_next
    ; Final byte found, clear escape state
    LDI r20, ANSI_ESCAPE
    LDI r0, 0
    STORE r20, r0
    JMP dp_next

dp_normal:
    ; Newline?
    CMPI r12, 10
    JZ r0, dp_newline

    ; Carriage return?
    CMPI r12, 13
    JZ r0, dp_next

    ; Skip non-printable (< 32)
    CMPI r12, 32
    BLT r0, dp_next

    ; Skip DEL and above (> 126)
    CMPI r12, 127
    BGE r0, dp_next

    ; Printable! Draw vertical bar: height = byte - 30, cap at 80
    SUB r12, r10
    SUB r12, r10
    LDI r14, 80
    CMP r12, r14
    BLT r0, dp_height_ok
    MOV r12, r14

dp_height_ok:
    ; Read cursor position
    LDI r20, TERM_CUR_X
    LOAD r1, r20
    LDI r20, TERM_CUR_Y
    LOAD r11, r20

    ; Check if we've gone past window width (180)
    CMPI r1, 170
    BGE r0, dp_newline

    ; Draw bar pixels -- save r10 (used as constant 1)
    MOV r18, r10
    LDI r4, 0

dp_bar:
    CMP r4, r12
    BGE r0, dp_after_bar

    ; WPIXEL win_id, x, y, color
    LDI r0, TERM_WIN
    LOAD r0, r0
    MOV r10, r1
    MOV r7, r11
    ADD r7, r4
    ; Color: bright green
    LDI r6, 0x22CC22
    WPIXEL r0, r10, r7, r6

    ADD r4, r18
    LDI r10, 1
    JMP dp_bar

dp_after_bar:
    ; Advance x cursor
    LDI r20, TERM_CUR_X
    LOAD r0, r20
    ADD r0, r10
    STORE r20, r0
    JMP dp_next

dp_newline:
    ; Reset x, advance y
    LDI r20, TERM_CUR_X
    LDI r0, 0
    STORE r20, r0
    LDI r20, TERM_CUR_Y
    LOAD r0, r20
    ADD r0, r10
    STORE r20, r0

dp_next:
    ADD r2, r10
    LDI r10, 1
    JMP dp_loop

dp_done:
    POP r31
    RET

; =========================================
; UPDATE_SYSMON
; =========================================
update_sysmon:
    PUSH r31
    LDI r10, 1

    ; Check window exists
    LDI r20, SYSMON_WIN
    LOAD r0, r20
    CMPI r0, 0
    JZ r0, us_done

    ; Check dirty flag
    LDI r20, DIRTY_SYSMON
    LOAD r0, r20
    CMPI r0, 0
    JZ r0, us_done

    ; Clear dirty
    LDI r20, DIRTY_SYSMON
    LDI r0, 0
    STORE r20, r0

    ; Heartbeat bar (frame % 50), cyan, at y=2
    LDI r20, FRAME_COUNT
    LOAD r12, r20
    LDI r8, 50
    MOD r12, r8
    LDI r11, 0

us_bar:
    CMP r11, r12
    BGE r0, us_dots
    LDI r0, SYSMON_WIN
    LOAD r0, r0
    MOV r10, r11
    LDI r7, 2
    LDI r6, COL_CYAN
    WPIXEL r0, r10, r7, r6
    LDI r10, 1
    ADD r11, r10
    JMP us_bar

us_dots:
    ; Dot row (frame % 16), yellow, at y=8
    LDI r20, FRAME_COUNT
    LOAD r12, r20
    LDI r8, 16
    MOD r12, r8
    LDI r11, 0

us_dot_loop:
    CMP r11, r12
    BGE r0, us_draw_text
    LDI r0, SYSMON_WIN
    LOAD r0, r0
    MOV r10, r11
    LDI r7, 8
    LDI r6, COL_YELLOW
    WPIXEL r0, r10, r7, r6
    LDI r10, 1
    ADD r11, r10
    JMP us_dot_loop

us_draw_text:
    ; "GEOS" pixel art at (5, 25)
    LDI r15, 5
    LDI r16, 25
    CALL pxl_G
    ADD r15, r10
    ADD r15, r10
    ADD r15, r10
    ADD r15, r10
    CALL pxl_E
    ADD r15, r10
    ADD r15, r10
    ADD r15, r10
    ADD r15, r10
    CALL pxl_O
    ADD r15, r10
    ADD r15, r10
    ADD r15, r10
    ADD r15, r10
    CALL pxl_S

    ; Redirty every 30 frames
    LDI r20, BLINK_COUNT
    LOAD r0, r20
    LDI r8, 30
    MOD r0, r8
    CMPI r0, 0
    JNZ r0, us_done
    LDI r20, DIRTY_SYSMON
    LDI r0, 1
    STORE r20, r0

us_done:
    POP r31
    RET

; =========================================
; UPDATE_TASKBAR -- activity bar
; =========================================
update_taskbar:
    PUSH r31
    LDI r10, 1

    ; Only every 10 frames
    LDI r20, FRAME_COUNT
    LOAD r0, r20
    LDI r8, 10
    MOD r0, r8
    CMPI r0, 0
    JNZ r0, ut_done

    ; Bar width = frame % 100 at y=249
    LDI r20, FRAME_COUNT
    LOAD r12, r20
    LDI r8, 100
    MOD r12, r8
    ; Save loop limit in r18 (r12 will be clobbered by color LDI)
    MOV r18, r12
    LDI r11, 0

ut_bar:
    CMP r11, r18
    BGE r0, ut_done
    MOV r10, r11
    LDI r7, 249
    LDI r6, 1
    LDI r5, 5
    LDI r12, 0x444466
    RECTF r10, r7, r6, r5, r12
    LDI r10, 1
    ADD r11, r10
    JMP ut_bar

ut_done:
    POP r31
    RET

; =========================================
; PIXEL LETTER ROUTINES (3x5 each)
; Draw at (r15, r16) in sysmon window, green
; =========================================

pxl_G:
    PUSH r31
    LDI r10, 1
    LDI r0, SYSMON_WIN
    LOAD r0, r0
    LDI r6, COL_GREEN
    MOV r10, r15
    MOV r7, r16
    WPIXEL r0, r10, r7, r6
    ADD r15, r10
    WPIXEL r0, r15, r7, r6
    ADD r15, r10
    WPIXEL r0, r15, r7, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    SUB r15, r10
    SUB r15, r10
    SUB r16, r10
    SUB r16, r10
    SUB r16, r10
    SUB r16, r10
    POP r31
    RET

pxl_E:
    PUSH r31
    LDI r10, 1
    LDI r0, SYSMON_WIN
    LOAD r0, r0
    LDI r6, COL_GREEN
    MOV r10, r15
    MOV r7, r16
    WPIXEL r0, r10, r7, r6
    ADD r15, r10
    WPIXEL r0, r15, r7, r6
    ADD r15, r10
    WPIXEL r0, r15, r7, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    SUB r15, r10
    SUB r15, r10
    SUB r16, r10
    SUB r16, r10
    SUB r16, r10
    SUB r16, r10
    POP r31
    RET

pxl_O:
    PUSH r31
    LDI r10, 1
    LDI r0, SYSMON_WIN
    LOAD r0, r0
    LDI r6, COL_GREEN
    MOV r10, r15
    MOV r7, r16
    WPIXEL r0, r10, r7, r6
    ADD r15, r10
    WPIXEL r0, r15, r7, r6
    ADD r15, r10
    WPIXEL r0, r15, r7, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    SUB r15, r10
    SUB r15, r10
    SUB r16, r10
    SUB r16, r10
    SUB r16, r10
    SUB r16, r10
    POP r31
    RET

pxl_S:
    PUSH r31
    LDI r10, 1
    LDI r0, SYSMON_WIN
    LOAD r0, r0
    LDI r6, COL_GREEN
    MOV r10, r15
    MOV r7, r16
    ADD r15, r10
    WPIXEL r0, r15, r7, r6
    ADD r15, r10
    WPIXEL r0, r15, r7, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r16, r10
    SUB r15, r10
    SUB r15, r10
    WPIXEL r0, r15, r16, r6
    ADD r15, r10
    WPIXEL r0, r15, r16, r6
    SUB r15, r10
    SUB r16, r10
    SUB r16, r10
    SUB r16, r10
    SUB r16, r10
    POP r31
    RET
