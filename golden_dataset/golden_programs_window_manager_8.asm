; DESCRIPTION: Display a object using color red at the screen.

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
LDI r5, 0x0A0A0A
FILL r5

; Desktop background (256 x 240)
LDI r8, 0
LDI r14, 0
LDI r10, 256
LDI r7, 240
LDI r2, COL_DESKTOP
RECTF r8, r14, r10, r7, r2

; Taskbar (256 x 16)
LDI r8, 0
LDI r14, 240
LDI r10, 256
LDI r7, 16
LDI r2, COL_TASKBAR
RECTF r8, r14, r10, r7, r2

; Taskbar label
LDI r20, TEMP_AREA
STRO r20, "Geometry OS"
LDI r8, 4
LDI r14, 243
LDI r10, TEMP_AREA
LDI r7, COL_GREEN
LDI r2, COL_TASKBAR
SMALLTEXT r8, r14, r10, r7, r2

; Init all variables to 0
LDI r20, TERM_WIN
LDI r5, 0
STORE r20, r5
LDI r20, SYSMON_WIN
STORE r20, r5
LDI r20, FOCUSED_WIN
STORE r20, r5
LDI r20, FRAME_COUNT
STORE r20, r5
LDI r20, DRAG_WIN
STORE r20, r5
LDI r20, BLINK_COUNT
STORE r20, r5
LDI r20, TERM_CUR_X
LDI r5, 0
STORE r20, r5
LDI r20, TERM_CUR_Y
LDI r5, 0
STORE r20, r5

; ANSI escape state: 0 = normal, 1 = in escape sequence
LDI r20, ANSI_ESCAPE
LDI r5, 0
STORE r20, r5

; PTY handle init to invalid
LDI r20, PTY_HANDLE
LDI r5, 0xFFFF
STORE r20, r5

; Dirty sysmon = start dirty
LDI r20, DIRTY_SYSMON
LDI r5, 1
STORE r20, r5

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
LDI r10, 180
LDI r7, 168
LDI r2, TITLE_TERM
LDI r5, 0
WINSYS r5
; r5 = window_id
LDI r20, TERM_WIN
STORE r20, r5

; Monitor: x=192, y=6, w=60, h=100
LDI r8, 192
LDI r14, 6
LDI r10, 60
LDI r7, 100
LDI r2, TITLE_MON
LDI r5, 0
WINSYS r5
; r5 = window_id
LDI r20, SYSMON_WIN
STORE r20, r5

; Focus terminal by default
LDI r20, FOCUSED_WIN
LDI r5, TERM_WIN
LOAD r5, r5
STORE r20, r5

; =========================================
; OPEN PTY FOR TERMINAL
; =========================================

; Null-terminate send buffer
LDI r20, PTY_SEND
LDI r5, 0
STORE r20, r5

; Open PTY: PTYOPEN cmd_addr_reg, handle_reg
LDI r2, PTY_SEND
PTYOPEN r2, r3
; r3 = slot index (handle), r5 = status

; Store handle
LDI r20, PTY_HANDLE
STORE r20, r3

; Also keep a copy in r28 for PTYWRITE/PTYREAD
LDI r28, 0
ADD r28, r3

; Set PTY size 24x80
LDI r0, 24
LDI r9, 80
PTYSIZE r28, r0, r9

; Send "clear" to PTY
LDI r20, PTY_SEND
STRO r20, "clear\n"
LDI r13, PTY_SEND
LDI r11, 6
PTYWRITE r28, r13, r11

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
    LOAD r5, r20
    ADD r5, r8
    STORE r20, r5

    LDI r20, FRAME_COUNT
    LOAD r5, r20
    ADD r5, r8
    STORE r20, r5

    FRAME

    ; Keyboard -> PTY if terminal focused
    IKEY r2
    JZ r2, main_loop

    LDI r20, FOCUSED_WIN
    LOAD r5, r20
    LDI r20, TERM_WIN
    LOAD r20, r20
    CMP r5, r20
    JNZ r5, main_loop

    ; Forward key to PTY
    LDI r20, PTY_SEND
    STORE r20, r2
    LDI r13, PTY_SEND
    LDI r11, 1
    PTYWRITE r28, r13, r11
    JMP main_loop

; =========================================
; HANDLE_MOUSE
; =========================================
handle_mouse:
    PUSH r31
    LDI r8, 1

    MOUSEQ r2
    ; r2=mx, r13=my, r11=btn

    ; Click (btn==2)
    CMPI r11, 2
    JNZ r5, hm_check_drag

    ; WINSYS HITTEST (op=4): r5=win_id, r8=hit_type
    LDI r5, 4
    WINSYS r5
    CMPI r5, 0
    JZ r5, hm_clear_drag

    ; hit_type 3 = close button
    CMPI r8, 3
    JNZ r5, hm_check_title
    ; Destroy window
    LDI r5, 1
    WINSYS r5
    ; Clear focus if we closed the focused window
    LDI r20, FOCUSED_WIN
    LDI r5, 0
    STORE r20, r5
    JMP hm_done

hm_check_title:
    ; hit_type 1 = title bar
    CMPI r8, 1
    JNZ r5, hm_check_body

    ; Focus + bring to front
    LDI r20, FOCUSED_WIN
    STORE r20, r5
    LDI r5, 2
    WINSYS r5

    ; Start drag: save win_id and mouse offset
    LDI r20, DRAG_WIN
    LDI r5, FOCUSED_WIN
    LOAD r5, r5
    STORE r20, r5

    ; Get window position via WINFO (op=6)
    LDI r5, 6
    LDI r8, TEMP_AREA
    WINSYS r5
    ; TEMP_AREA[0]=x, TEMP_AREA[1]=y
    LDI r20, TEMP_AREA
    LOAD r15, r20
    ADD r20, r8
    LOAD r12, r20
    SUB r15, r2
    SUB r12, r13
    LDI r20, DRAG_OX
    STORE r20, r15
    LDI r20, DRAG_OY
    STORE r20, r12
    JMP hm_done

hm_check_body:
    ; hit_type 2 = body -> focus only
    LDI r20, FOCUSED_WIN
    STORE r20, r5
    LDI r5, 2
    WINSYS r5
    JMP hm_done

hm_check_drag:
    ; btn==1 (held down) -> drag if active
    CMPI r11, 1
    JNZ r5, hm_clear_drag

    LDI r20, DRAG_WIN
    LOAD r5, r20
    CMPI r5, 0
    JZ r5, hm_clear_drag

    ; Move window: new_pos = mouse - offset
    LDI r20, DRAG_OX
    LOAD r15, r20
    LDI r20, DRAG_OY
    LOAD r12, r20
    SUB r2, r15
    SUB r13, r12
    ; WINSYS MOVETO (op=5): r5=win_id, r8=new_x, r14=new_y
    LDI r10, 5
    LDI r5, DRAG_WIN
    LOAD r5, r5
    WINSYS r10
    JMP hm_done

hm_clear_drag:
    LDI r20, DRAG_WIN
    LDI r5, 0
    STORE r20, r5

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
    LOAD r5, r20
    CMPI r5, 0
    JZ r5, dp_done

    ; Check PTY is valid
    LDI r20, PTY_HANDLE
    LOAD r5, r20
    CMPI r5, 0xFFFF
    JZ r5, dp_done

    ; Read from PTY (max 16 bytes per frame to stay responsive)
    LDI r13, PTY_RECV
    LDI r11, 16
    PTYREAD r28, r13, r11
    MOV r15, r5
    ; 0 = no data, 0xFFFFFFFF = PTY closed -> skip
    CMPI r15, 0
    JZ r5, dp_done
    CMPI r15, 0
    ; r15 != 0 here. Check for error (0xFFFFFFFF = -1 = all bits set)
    ; Use AND to check: if r15 == 0xFFFFFFFF, AND with itself stays same
    ; Simpler: just check if r15 > 4096 (our max read)
    LDI r5, 4097
    CMP r15, r5
    BGE r5, dp_done

    LDI r12, 0

dp_loop:
    CMP r12, r15
    BGE r5, dp_done

    ; Load byte
    LDI r20, PTY_RECV
    ADD r20, r12
    LOAD r2, r20

    ; --- ANSI escape stripping (two-state) ---
    ; State 0 = normal, State 1 = saw ESC, State 2 = saw ESC[ (CSI)
    ; Check if we're in an escape sequence
    LDI r20, ANSI_ESCAPE
    LOAD r5, r20
    CMPI r5, 0
    JNZ r5, dp_in_escape

    ; State 0: normal mode, check for ESC
dp_check_esc:
    CMPI r2, 27
    JNZ r5, dp_normal
    ; Saw ESC -> state 1
    LDI r20, ANSI_ESCAPE
    LDI r5, 1
    STORE r20, r5
    JMP dp_next

dp_in_escape:
    ; State 1 or 2
    CMPI r5, 2
    JZ r5, dp_csi_mode

    ; State 1: saw ESC, check for CSI introducer '['
    CMPI r2, 0x5B
    JZ r5, dp_enter_csi
    ; Not '[', check for single-char escape terminator (0x40-0x7E)
    CMPI r2, 0x40
    BLT r5, dp_next
    CMPI r2, 0x7F
    BGE r5, dp_next
    ; Terminator found (e.g. ESC M), clear state
    LDI r20, ANSI_ESCAPE
    LDI r5, 0
    STORE r20, r5
    JMP dp_next

dp_enter_csi:
    ; Saw ESC[, enter CSI mode (state 2)
    LDI r20, ANSI_ESCAPE
    LDI r5, 2
    STORE r20, r5
    JMP dp_next

dp_csi_mode:
    ; State 2: in CSI sequence, skip params until final byte (0x40-0x7E)
    CMPI r2, 0x40
    BLT r5, dp_next
    CMPI r2, 0x7F
    BGE r5, dp_next
    ; Final byte found, clear escape state
    LDI r20, ANSI_ESCAPE
    LDI r5, 0
    STORE r20, r5
    JMP dp_next

dp_normal:
    ; Newline?
    CMPI r2, 10
    JZ r5, dp_newline

    ; Carriage return?
    CMPI r2, 13
    JZ r5, dp_next

    ; Skip non-printable (< 32)
    CMPI r2, 32
    BLT r5, dp_next

    ; Skip DEL and above (> 126)
    CMPI r2, 127
    BGE r5, dp_next

    ; Printable! Draw vertical bar: height = byte - 30, cap at 80
    SUB r2, r8
    SUB r2, r8
    LDI r11, 80
    CMP r2, r11
    BLT r5, dp_height_ok
    MOV r2, r11

dp_height_ok:
    ; Read cursor position
    LDI r20, TERM_CUR_X
    LOAD r3, r20
    LDI r20, TERM_CUR_Y
    LOAD r0, r20

    ; Check if we've gone past window width (180)
    CMPI r3, 170
    BGE r5, dp_newline

    ; Draw bar pixels -- save r8 (used as constant 1)
    MOV r18, r8
    LDI r9, 0

dp_bar:
    CMP r9, r2
    BGE r5, dp_after_bar

    ; WPIXEL win_id, x, y, color
    LDI r5, TERM_WIN
    LOAD r5, r5
    MOV r8, r3
    MOV r14, r0
    ADD r14, r9
    ; Color: bright green
    LDI r10, 0x22CC22
    WPIXEL r5, r8, r14, r10

    ADD r9, r18
    LDI r8, 1
    JMP dp_bar

dp_after_bar:
    ; Advance x cursor
    LDI r20, TERM_CUR_X
    LOAD r5, r20
    ADD r5, r8
    STORE r20, r5
    JMP dp_next

dp_newline:
    ; Reset x, advance y
    LDI r20, TERM_CUR_X
    LDI r5, 0
    STORE r20, r5
    LDI r20, TERM_CUR_Y
    LOAD r5, r20
    ADD r5, r8
    STORE r20, r5

dp_next:
    ADD r12, r8
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
    LOAD r5, r20
    CMPI r5, 0
    JZ r5, us_done

    ; Check dirty flag
    LDI r20, DIRTY_SYSMON
    LOAD r5, r20
    CMPI r5, 0
    JZ r5, us_done

    ; Clear dirty
    LDI r20, DIRTY_SYSMON
    LDI r5, 0
    STORE r20, r5

    ; Heartbeat bar (frame % 50), cyan, at y=2
    LDI r20, FRAME_COUNT
    LOAD r2, r20
    LDI r13, 50
    MOD r2, r13
    LDI r0, 0

us_bar:
    CMP r0, r2
    BGE r5, us_dots
    LDI r5, SYSMON_WIN
    LOAD r5, r5
    MOV r8, r0
    LDI r14, 2
    LDI r10, COL_CYAN
    WPIXEL r5, r8, r14, r10
    LDI r8, 1
    ADD r0, r8
    JMP us_bar

us_dots:
    ; Dot row (frame % 16), yellow, at y=8
    LDI r20, FRAME_COUNT
    LOAD r2, r20
    LDI r13, 16
    MOD r2, r13
    LDI r0, 0

us_dot_loop:
    CMP r0, r2
    BGE r5, us_draw_text
    LDI r5, SYSMON_WIN
    LOAD r5, r5
    MOV r8, r0
    LDI r14, 8
    LDI r10, COL_YELLOW
    WPIXEL r5, r8, r14, r10
    LDI r8, 1
    ADD r0, r8
    JMP us_dot_loop

us_draw_text:
    ; "GEOS" pixel art at (5, 25)
    LDI r6, 5
    LDI r16, 25
    CALL pxl_G
    ADD r6, r8
    ADD r6, r8
    ADD r6, r8
    ADD r6, r8
    CALL pxl_E
    ADD r6, r8
    ADD r6, r8
    ADD r6, r8
    ADD r6, r8
    CALL pxl_O
    ADD r6, r8
    ADD r6, r8
    ADD r6, r8
    ADD r6, r8
    CALL pxl_S

    ; Redirty every 30 frames
    LDI r20, BLINK_COUNT
    LOAD r5, r20
    LDI r13, 30
    MOD r5, r13
    CMPI r5, 0
    JNZ r5, us_done
    LDI r20, DIRTY_SYSMON
    LDI r5, 1
    STORE r20, r5

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
    LOAD r5, r20
    LDI r13, 10
    MOD r5, r13
    CMPI r5, 0
    JNZ r5, ut_done

    ; Bar width = frame % 100 at y=249
    LDI r20, FRAME_COUNT
    LOAD r2, r20
    LDI r13, 100
    MOD r2, r13
    ; Save loop limit in r18 (r2 will be clobbered by color LDI)
    MOV r18, r2
    LDI r0, 0

ut_bar:
    CMP r0, r18
    BGE r5, ut_done
    MOV r8, r0
    LDI r14, 249
    LDI r10, 1
    LDI r7, 5
    LDI r2, 0x444466
    RECTF r8, r14, r10, r7, r2
    LDI r8, 1
    ADD r0, r8
    JMP ut_bar

ut_done:
    POP r31
    RET

; =========================================
; PIXEL LETTER ROUTINES (3x5 each)
; Draw at (r6, r16) in sysmon window, green
; =========================================

pxl_G:
    PUSH r31
    LDI r8, 1
    LDI r5, SYSMON_WIN
    LOAD r5, r5
    LDI r10, COL_GREEN
    MOV r8, r6
    MOV r14, r16
    WPIXEL r5, r8, r14, r10
    ADD r6, r8
    WPIXEL r5, r6, r14, r10
    ADD r6, r8
    WPIXEL r5, r6, r14, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    SUB r6, r8
    SUB r6, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    POP r31
    RET

pxl_E:
    PUSH r31
    LDI r8, 1
    LDI r5, SYSMON_WIN
    LOAD r5, r5
    LDI r10, COL_GREEN
    MOV r8, r6
    MOV r14, r16
    WPIXEL r5, r8, r14, r10
    ADD r6, r8
    WPIXEL r5, r6, r14, r10
    ADD r6, r8
    WPIXEL r5, r6, r14, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    SUB r6, r8
    SUB r6, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    POP r31
    RET

pxl_O:
    PUSH r31
    LDI r8, 1
    LDI r5, SYSMON_WIN
    LOAD r5, r5
    LDI r10, COL_GREEN
    MOV r8, r6
    MOV r14, r16
    WPIXEL r5, r8, r14, r10
    ADD r6, r8
    WPIXEL r5, r6, r14, r10
    ADD r6, r8
    WPIXEL r5, r6, r14, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    SUB r6, r8
    SUB r6, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    POP r31
    RET

pxl_S:
    PUSH r31
    LDI r8, 1
    LDI r5, SYSMON_WIN
    LOAD r5, r5
    LDI r10, COL_GREEN
    MOV r8, r6
    MOV r14, r16
    ADD r6, r8
    WPIXEL r5, r6, r14, r10
    ADD r6, r8
    WPIXEL r5, r6, r14, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r16, r8
    SUB r6, r8
    SUB r6, r8
    WPIXEL r5, r6, r16, r10
    ADD r6, r8
    WPIXEL r5, r6, r16, r10
    SUB r6, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    SUB r16, r8
    POP r31
    RET
