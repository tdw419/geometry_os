; DESCRIPTION: Draws a red object at the screen with fixed size.

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

LDI r3, 1
LDI r30, 0xFD00

; Clear screen
LDI r2, 0x0A0A0A
FILL r2

; Desktop background (256 x 240)
LDI r3, 0
LDI r1, 0
LDI r12, 256
LDI r7, 240
LDI r13, COL_DESKTOP
RECTF r3, r1, r12, r7, r13

; Taskbar (256 x 16)
LDI r3, 0
LDI r1, 240
LDI r12, 256
LDI r7, 16
LDI r13, COL_TASKBAR
RECTF r3, r1, r12, r7, r13

; Taskbar label
LDI r20, TEMP_AREA
STRO r20, "Geometry OS"
LDI r3, 4
LDI r1, 243
LDI r12, TEMP_AREA
LDI r7, COL_GREEN
LDI r13, COL_TASKBAR
SMALLTEXT r3, r1, r12, r7, r13

; Init all variables to 0
LDI r20, TERM_WIN
LDI r2, 0
STORE r20, r2
LDI r20, SYSMON_WIN
STORE r20, r2
LDI r20, FOCUSED_WIN
STORE r20, r2
LDI r20, FRAME_COUNT
STORE r20, r2
LDI r20, DRAG_WIN
STORE r20, r2
LDI r20, BLINK_COUNT
STORE r20, r2
LDI r20, TERM_CUR_X
LDI r2, 0
STORE r20, r2
LDI r20, TERM_CUR_Y
LDI r2, 0
STORE r20, r2

; ANSI escape state: 0 = normal, 1 = in escape sequence
LDI r20, ANSI_ESCAPE
LDI r2, 0
STORE r20, r2

; PTY handle init to invalid
LDI r20, PTY_HANDLE
LDI r2, 0xFFFF
STORE r20, r2

; Dirty sysmon = start dirty
LDI r20, DIRTY_SYSMON
LDI r2, 1
STORE r20, r2

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
LDI r3, 4
LDI r1, 6
LDI r12, 180
LDI r7, 168
LDI r13, TITLE_TERM
LDI r2, 0
WINSYS r2
; r2 = window_id
LDI r20, TERM_WIN
STORE r20, r2

; Monitor: x=192, y=6, w=60, h=100
LDI r3, 192
LDI r1, 6
LDI r12, 60
LDI r7, 100
LDI r13, TITLE_MON
LDI r2, 0
WINSYS r2
; r2 = window_id
LDI r20, SYSMON_WIN
STORE r20, r2

; Focus terminal by default
LDI r20, FOCUSED_WIN
LDI r2, TERM_WIN
LOAD r2, r2
STORE r20, r2

; =========================================
; OPEN PTY FOR TERMINAL
; =========================================

; Null-terminate send buffer
LDI r20, PTY_SEND
LDI r2, 0
STORE r20, r2

; Open PTY: PTYOPEN cmd_addr_reg, handle_reg
LDI r13, PTY_SEND
PTYOPEN r13, r9
; r9 = slot index (handle), r2 = status

; Store handle
LDI r20, PTY_HANDLE
STORE r20, r9

; Also keep a copy in r28 for PTYWRITE/PTYREAD
LDI r28, 0
ADD r28, r9

; Set PTY size 24x80
LDI r6, 24
LDI r10, 80
PTYSIZE r28, r6, r10

; Send "clear" to PTY
LDI r20, PTY_SEND
STRO r20, "clear\n"
LDI r8, PTY_SEND
LDI r5, 6
PTYWRITE r28, r8, r5

LDI r3, 1

; =========================================
; MAIN LOOP
; =========================================

main_loop:
    LDI r3, 1

    CALL handle_mouse
    CALL drain_pty
    CALL update_sysmon
    CALL update_taskbar

    ; Increment counters
    LDI r20, BLINK_COUNT
    LOAD r2, r20
    ADD r2, r3
    STORE r20, r2

    LDI r20, FRAME_COUNT
    LOAD r2, r20
    ADD r2, r3
    STORE r20, r2

    FRAME

    ; Keyboard -> PTY if terminal focused
    IKEY r13
    JZ r13, main_loop

    LDI r20, FOCUSED_WIN
    LOAD r2, r20
    LDI r20, TERM_WIN
    LOAD r20, r20
    CMP r2, r20
    JNZ r2, main_loop

    ; Forward key to PTY
    LDI r20, PTY_SEND
    STORE r20, r13
    LDI r8, PTY_SEND
    LDI r5, 1
    PTYWRITE r28, r8, r5
    JMP main_loop

; =========================================
; HANDLE_MOUSE
; =========================================
handle_mouse:
    PUSH r31
    LDI r3, 1

    MOUSEQ r13
    ; r13=mx, r8=my, r5=btn

    ; Click (btn==2)
    CMPI r5, 2
    JNZ r2, hm_check_drag

    ; WINSYS HITTEST (op=4): r2=win_id, r3=hit_type
    LDI r2, 4
    WINSYS r2
    CMPI r2, 0
    JZ r2, hm_clear_drag

    ; hit_type 3 = close button
    CMPI r3, 3
    JNZ r2, hm_check_title
    ; Destroy window
    LDI r2, 1
    WINSYS r2
    ; Clear focus if we closed the focused window
    LDI r20, FOCUSED_WIN
    LDI r2, 0
    STORE r20, r2
    JMP hm_done

hm_check_title:
    ; hit_type 1 = title bar
    CMPI r3, 1
    JNZ r2, hm_check_body

    ; Focus + bring to front
    LDI r20, FOCUSED_WIN
    STORE r20, r2
    LDI r2, 2
    WINSYS r2

    ; Start drag: save win_id and mouse offset
    LDI r20, DRAG_WIN
    LDI r2, FOCUSED_WIN
    LOAD r2, r2
    STORE r20, r2

    ; Get window position via WINFO (op=6)
    LDI r2, 6
    LDI r3, TEMP_AREA
    WINSYS r2
    ; TEMP_AREA[0]=x, TEMP_AREA[1]=y
    LDI r20, TEMP_AREA
    LOAD r0, r20
    ADD r20, r3
    LOAD r14, r20
    SUB r0, r13
    SUB r14, r8
    LDI r20, DRAG_OX
    STORE r20, r0
    LDI r20, DRAG_OY
    STORE r20, r14
    JMP hm_done

hm_check_body:
    ; hit_type 2 = body -> focus only
    LDI r20, FOCUSED_WIN
    STORE r20, r2
    LDI r2, 2
    WINSYS r2
    JMP hm_done

hm_check_drag:
    ; btn==1 (held down) -> drag if active
    CMPI r5, 1
    JNZ r2, hm_clear_drag

    LDI r20, DRAG_WIN
    LOAD r2, r20
    CMPI r2, 0
    JZ r2, hm_clear_drag

    ; Move window: new_pos = mouse - offset
    LDI r20, DRAG_OX
    LOAD r0, r20
    LDI r20, DRAG_OY
    LOAD r14, r20
    SUB r13, r0
    SUB r8, r14
    ; WINSYS MOVETO (op=5): r2=win_id, r3=new_x, r1=new_y
    LDI r12, 5
    LDI r2, DRAG_WIN
    LOAD r2, r2
    WINSYS r12
    JMP hm_done

hm_clear_drag:
    LDI r20, DRAG_WIN
    LDI r2, 0
    STORE r20, r2

hm_done:
    POP r31
    RET

; =========================================
; DRAIN_PTY -- render PTY output as pixel bars
; =========================================
drain_pty:
    PUSH r31
    LDI r3, 1

    ; Check terminal window exists
    LDI r20, TERM_WIN
    LOAD r2, r20
    CMPI r2, 0
    JZ r2, dp_done

    ; Check PTY is valid
    LDI r20, PTY_HANDLE
    LOAD r2, r20
    CMPI r2, 0xFFFF
    JZ r2, dp_done

    ; Read from PTY (max 16 bytes per frame to stay responsive)
    LDI r8, PTY_RECV
    LDI r5, 16
    PTYREAD r28, r8, r5
    MOV r0, r2
    ; 0 = no data, 0xFFFFFFFF = PTY closed -> skip
    CMPI r0, 0
    JZ r2, dp_done
    CMPI r0, 0
    ; r0 != 0 here. Check for error (0xFFFFFFFF = -1 = all bits set)
    ; Use AND to check: if r0 == 0xFFFFFFFF, AND with itself stays same
    ; Simpler: just check if r0 > 4096 (our max read)
    LDI r2, 4097
    CMP r0, r2
    BGE r2, dp_done

    LDI r14, 0

dp_loop:
    CMP r14, r0
    BGE r2, dp_done

    ; Load byte
    LDI r20, PTY_RECV
    ADD r20, r14
    LOAD r13, r20

    ; --- ANSI escape stripping (two-state) ---
    ; State 0 = normal, State 1 = saw ESC, State 2 = saw ESC[ (CSI)
    ; Check if we're in an escape sequence
    LDI r20, ANSI_ESCAPE
    LOAD r2, r20
    CMPI r2, 0
    JNZ r2, dp_in_escape

    ; State 0: normal mode, check for ESC
dp_check_esc:
    CMPI r13, 27
    JNZ r2, dp_normal
    ; Saw ESC -> state 1
    LDI r20, ANSI_ESCAPE
    LDI r2, 1
    STORE r20, r2
    JMP dp_next

dp_in_escape:
    ; State 1 or 2
    CMPI r2, 2
    JZ r2, dp_csi_mode

    ; State 1: saw ESC, check for CSI introducer '['
    CMPI r13, 0x5B
    JZ r2, dp_enter_csi
    ; Not '[', check for single-char escape terminator (0x40-0x7E)
    CMPI r13, 0x40
    BLT r2, dp_next
    CMPI r13, 0x7F
    BGE r2, dp_next
    ; Terminator found (e.g. ESC M), clear state
    LDI r20, ANSI_ESCAPE
    LDI r2, 0
    STORE r20, r2
    JMP dp_next

dp_enter_csi:
    ; Saw ESC[, enter CSI mode (state 2)
    LDI r20, ANSI_ESCAPE
    LDI r2, 2
    STORE r20, r2
    JMP dp_next

dp_csi_mode:
    ; State 2: in CSI sequence, skip params until final byte (0x40-0x7E)
    CMPI r13, 0x40
    BLT r2, dp_next
    CMPI r13, 0x7F
    BGE r2, dp_next
    ; Final byte found, clear escape state
    LDI r20, ANSI_ESCAPE
    LDI r2, 0
    STORE r20, r2
    JMP dp_next

dp_normal:
    ; Newline?
    CMPI r13, 10
    JZ r2, dp_newline

    ; Carriage return?
    CMPI r13, 13
    JZ r2, dp_next

    ; Skip non-printable (< 32)
    CMPI r13, 32
    BLT r2, dp_next

    ; Skip DEL and above (> 126)
    CMPI r13, 127
    BGE r2, dp_next

    ; Printable! Draw vertical bar: height = byte - 30, cap at 80
    SUB r13, r3
    SUB r13, r3
    LDI r5, 80
    CMP r13, r5
    BLT r2, dp_height_ok
    MOV r13, r5

dp_height_ok:
    ; Read cursor position
    LDI r20, TERM_CUR_X
    LOAD r9, r20
    LDI r20, TERM_CUR_Y
    LOAD r6, r20

    ; Check if we've gone past window width (180)
    CMPI r9, 170
    BGE r2, dp_newline

    ; Draw bar pixels -- save r3 (used as constant 1)
    MOV r18, r3
    LDI r10, 0

dp_bar:
    CMP r10, r13
    BGE r2, dp_after_bar

    ; WPIXEL win_id, x, y, color
    LDI r2, TERM_WIN
    LOAD r2, r2
    MOV r3, r9
    MOV r1, r6
    ADD r1, r10
    ; Color: bright green
    LDI r12, 0x22CC22
    WPIXEL r2, r3, r1, r12

    ADD r10, r18
    LDI r3, 1
    JMP dp_bar

dp_after_bar:
    ; Advance x cursor
    LDI r20, TERM_CUR_X
    LOAD r2, r20
    ADD r2, r3
    STORE r20, r2
    JMP dp_next

dp_newline:
    ; Reset x, advance y
    LDI r20, TERM_CUR_X
    LDI r2, 0
    STORE r20, r2
    LDI r20, TERM_CUR_Y
    LOAD r2, r20
    ADD r2, r3
    STORE r20, r2

dp_next:
    ADD r14, r3
    LDI r3, 1
    JMP dp_loop

dp_done:
    POP r31
    RET

; =========================================
; UPDATE_SYSMON
; =========================================
update_sysmon:
    PUSH r31
    LDI r3, 1

    ; Check window exists
    LDI r20, SYSMON_WIN
    LOAD r2, r20
    CMPI r2, 0
    JZ r2, us_done

    ; Check dirty flag
    LDI r20, DIRTY_SYSMON
    LOAD r2, r20
    CMPI r2, 0
    JZ r2, us_done

    ; Clear dirty
    LDI r20, DIRTY_SYSMON
    LDI r2, 0
    STORE r20, r2

    ; Heartbeat bar (frame % 50), cyan, at y=2
    LDI r20, FRAME_COUNT
    LOAD r13, r20
    LDI r8, 50
    MOD r13, r8
    LDI r6, 0

us_bar:
    CMP r6, r13
    BGE r2, us_dots
    LDI r2, SYSMON_WIN
    LOAD r2, r2
    MOV r3, r6
    LDI r1, 2
    LDI r12, COL_CYAN
    WPIXEL r2, r3, r1, r12
    LDI r3, 1
    ADD r6, r3
    JMP us_bar

us_dots:
    ; Dot row (frame % 16), yellow, at y=8
    LDI r20, FRAME_COUNT
    LOAD r13, r20
    LDI r8, 16
    MOD r13, r8
    LDI r6, 0

us_dot_loop:
    CMP r6, r13
    BGE r2, us_draw_text
    LDI r2, SYSMON_WIN
    LOAD r2, r2
    MOV r3, r6
    LDI r1, 8
    LDI r12, COL_YELLOW
    WPIXEL r2, r3, r1, r12
    LDI r3, 1
    ADD r6, r3
    JMP us_dot_loop

us_draw_text:
    ; "GEOS" pixel art at (5, 25)
    LDI r11, 5
    LDI r16, 25
    CALL pxl_G
    ADD r11, r3
    ADD r11, r3
    ADD r11, r3
    ADD r11, r3
    CALL pxl_E
    ADD r11, r3
    ADD r11, r3
    ADD r11, r3
    ADD r11, r3
    CALL pxl_O
    ADD r11, r3
    ADD r11, r3
    ADD r11, r3
    ADD r11, r3
    CALL pxl_S

    ; Redirty every 30 frames
    LDI r20, BLINK_COUNT
    LOAD r2, r20
    LDI r8, 30
    MOD r2, r8
    CMPI r2, 0
    JNZ r2, us_done
    LDI r20, DIRTY_SYSMON
    LDI r2, 1
    STORE r20, r2

us_done:
    POP r31
    RET

; =========================================
; UPDATE_TASKBAR -- activity bar
; =========================================
update_taskbar:
    PUSH r31
    LDI r3, 1

    ; Only every 10 frames
    LDI r20, FRAME_COUNT
    LOAD r2, r20
    LDI r8, 10
    MOD r2, r8
    CMPI r2, 0
    JNZ r2, ut_done

    ; Bar width = frame % 100 at y=249
    LDI r20, FRAME_COUNT
    LOAD r13, r20
    LDI r8, 100
    MOD r13, r8
    ; Save loop limit in r18 (r13 will be clobbered by color LDI)
    MOV r18, r13
    LDI r6, 0

ut_bar:
    CMP r6, r18
    BGE r2, ut_done
    MOV r3, r6
    LDI r1, 249
    LDI r12, 1
    LDI r7, 5
    LDI r13, 0x444466
    RECTF r3, r1, r12, r7, r13
    LDI r3, 1
    ADD r6, r3
    JMP ut_bar

ut_done:
    POP r31
    RET

; =========================================
; PIXEL LETTER ROUTINES (3x5 each)
; Draw at (r11, r16) in sysmon window, green
; =========================================

pxl_G:
    PUSH r31
    LDI r3, 1
    LDI r2, SYSMON_WIN
    LOAD r2, r2
    LDI r12, COL_GREEN
    MOV r3, r11
    MOV r1, r16
    WPIXEL r2, r3, r1, r12
    ADD r11, r3
    WPIXEL r2, r11, r1, r12
    ADD r11, r3
    WPIXEL r2, r11, r1, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    SUB r11, r3
    SUB r11, r3
    SUB r16, r3
    SUB r16, r3
    SUB r16, r3
    SUB r16, r3
    POP r31
    RET

pxl_E:
    PUSH r31
    LDI r3, 1
    LDI r2, SYSMON_WIN
    LOAD r2, r2
    LDI r12, COL_GREEN
    MOV r3, r11
    MOV r1, r16
    WPIXEL r2, r3, r1, r12
    ADD r11, r3
    WPIXEL r2, r11, r1, r12
    ADD r11, r3
    WPIXEL r2, r11, r1, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    SUB r11, r3
    SUB r11, r3
    SUB r16, r3
    SUB r16, r3
    SUB r16, r3
    SUB r16, r3
    POP r31
    RET

pxl_O:
    PUSH r31
    LDI r3, 1
    LDI r2, SYSMON_WIN
    LOAD r2, r2
    LDI r12, COL_GREEN
    MOV r3, r11
    MOV r1, r16
    WPIXEL r2, r3, r1, r12
    ADD r11, r3
    WPIXEL r2, r11, r1, r12
    ADD r11, r3
    WPIXEL r2, r11, r1, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    SUB r11, r3
    SUB r11, r3
    SUB r16, r3
    SUB r16, r3
    SUB r16, r3
    SUB r16, r3
    POP r31
    RET

pxl_S:
    PUSH r31
    LDI r3, 1
    LDI r2, SYSMON_WIN
    LOAD r2, r2
    LDI r12, COL_GREEN
    MOV r3, r11
    MOV r1, r16
    ADD r11, r3
    WPIXEL r2, r11, r1, r12
    ADD r11, r3
    WPIXEL r2, r11, r1, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r16, r3
    SUB r11, r3
    SUB r11, r3
    WPIXEL r2, r11, r16, r12
    ADD r11, r3
    WPIXEL r2, r11, r16, r12
    SUB r11, r3
    SUB r16, r3
    SUB r16, r3
    SUB r16, r3
    SUB r16, r3
    POP r31
    RET
