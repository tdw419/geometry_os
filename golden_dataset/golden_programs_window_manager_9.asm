; DESCRIPTION: Geometry OS program to draw a red object.

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

LDI r5, 1
LDI r30, 0xFD00

; Clear screen
LDI r7, 0x0A0A0A
FILL r7

; Desktop background (256 x 240)
LDI r5, 0
LDI r6, 0
LDI r9, 256
LDI r1, 240
LDI r12, COL_DESKTOP
RECTF r5, r6, r9, r1, r12

; Taskbar (256 x 16)
LDI r5, 0
LDI r6, 240
LDI r9, 256
LDI r1, 16
LDI r12, COL_TASKBAR
RECTF r5, r6, r9, r1, r12

; Taskbar label
LDI r20, TEMP_AREA
STRO r20, "Geometry OS"
LDI r5, 4
LDI r6, 243
LDI r9, TEMP_AREA
LDI r1, COL_GREEN
LDI r12, COL_TASKBAR
SMALLTEXT r5, r6, r9, r1, r12

; Init all variables to 0
LDI r20, TERM_WIN
LDI r7, 0
STORE r20, r7
LDI r20, SYSMON_WIN
STORE r20, r7
LDI r20, FOCUSED_WIN
STORE r20, r7
LDI r20, FRAME_COUNT
STORE r20, r7
LDI r20, DRAG_WIN
STORE r20, r7
LDI r20, BLINK_COUNT
STORE r20, r7
LDI r20, TERM_CUR_X
LDI r7, 0
STORE r20, r7
LDI r20, TERM_CUR_Y
LDI r7, 0
STORE r20, r7

; ANSI escape state: 0 = normal, 1 = in escape sequence
LDI r20, ANSI_ESCAPE
LDI r7, 0
STORE r20, r7

; PTY handle init to invalid
LDI r20, PTY_HANDLE
LDI r7, 0xFFFF
STORE r20, r7

; Dirty sysmon = start dirty
LDI r20, DIRTY_SYSMON
LDI r7, 1
STORE r20, r7

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
LDI r5, 4
LDI r6, 6
LDI r9, 180
LDI r1, 168
LDI r12, TITLE_TERM
LDI r7, 0
WINSYS r7
; r7 = window_id
LDI r20, TERM_WIN
STORE r20, r7

; Monitor: x=192, y=6, w=60, h=100
LDI r5, 192
LDI r6, 6
LDI r9, 60
LDI r1, 100
LDI r12, TITLE_MON
LDI r7, 0
WINSYS r7
; r7 = window_id
LDI r20, SYSMON_WIN
STORE r20, r7

; Focus terminal by default
LDI r20, FOCUSED_WIN
LDI r7, TERM_WIN
LOAD r7, r7
STORE r20, r7

; =========================================
; OPEN PTY FOR TERMINAL
; =========================================

; Null-terminate send buffer
LDI r20, PTY_SEND
LDI r7, 0
STORE r20, r7

; Open PTY: PTYOPEN cmd_addr_reg, handle_reg
LDI r12, PTY_SEND
PTYOPEN r12, r15
; r15 = slot index (handle), r7 = status

; Store handle
LDI r20, PTY_HANDLE
STORE r20, r15

; Also keep a copy in r28 for PTYWRITE/PTYREAD
LDI r28, 0
ADD r28, r15

; Set PTY size 24x80
LDI r2, 24
LDI r8, 80
PTYSIZE r28, r2, r8

; Send "clear" to PTY
LDI r20, PTY_SEND
STRO r20, "clear\n"
LDI r10, PTY_SEND
LDI r3, 6
PTYWRITE r28, r10, r3

LDI r5, 1

; =========================================
; MAIN LOOP
; =========================================

main_loop:
    LDI r5, 1

    CALL handle_mouse
    CALL drain_pty
    CALL update_sysmon
    CALL update_taskbar

    ; Increment counters
    LDI r20, BLINK_COUNT
    LOAD r7, r20
    ADD r7, r5
    STORE r20, r7

    LDI r20, FRAME_COUNT
    LOAD r7, r20
    ADD r7, r5
    STORE r20, r7

    FRAME

    ; Keyboard -> PTY if terminal focused
    IKEY r12
    JZ r12, main_loop

    LDI r20, FOCUSED_WIN
    LOAD r7, r20
    LDI r20, TERM_WIN
    LOAD r20, r20
    CMP r7, r20
    JNZ r7, main_loop

    ; Forward key to PTY
    LDI r20, PTY_SEND
    STORE r20, r12
    LDI r10, PTY_SEND
    LDI r3, 1
    PTYWRITE r28, r10, r3
    JMP main_loop

; =========================================
; HANDLE_MOUSE
; =========================================
handle_mouse:
    PUSH r31
    LDI r5, 1

    MOUSEQ r12
    ; r12=mx, r10=my, r3=btn

    ; Click (btn==2)
    CMPI r3, 2
    JNZ r7, hm_check_drag

    ; WINSYS HITTEST (op=4): r7=win_id, r5=hit_type
    LDI r7, 4
    WINSYS r7
    CMPI r7, 0
    JZ r7, hm_clear_drag

    ; hit_type 3 = close button
    CMPI r5, 3
    JNZ r7, hm_check_title
    ; Destroy window
    LDI r7, 1
    WINSYS r7
    ; Clear focus if we closed the focused window
    LDI r20, FOCUSED_WIN
    LDI r7, 0
    STORE r20, r7
    JMP hm_done

hm_check_title:
    ; hit_type 1 = title bar
    CMPI r5, 1
    JNZ r7, hm_check_body

    ; Focus + bring to front
    LDI r20, FOCUSED_WIN
    STORE r20, r7
    LDI r7, 2
    WINSYS r7

    ; Start drag: save win_id and mouse offset
    LDI r20, DRAG_WIN
    LDI r7, FOCUSED_WIN
    LOAD r7, r7
    STORE r20, r7

    ; Get window position via WINFO (op=6)
    LDI r7, 6
    LDI r5, TEMP_AREA
    WINSYS r7
    ; TEMP_AREA[0]=x, TEMP_AREA[1]=y
    LDI r20, TEMP_AREA
    LOAD r14, r20
    ADD r20, r5
    LOAD r11, r20
    SUB r14, r12
    SUB r11, r10
    LDI r20, DRAG_OX
    STORE r20, r14
    LDI r20, DRAG_OY
    STORE r20, r11
    JMP hm_done

hm_check_body:
    ; hit_type 2 = body -> focus only
    LDI r20, FOCUSED_WIN
    STORE r20, r7
    LDI r7, 2
    WINSYS r7
    JMP hm_done

hm_check_drag:
    ; btn==1 (held down) -> drag if active
    CMPI r3, 1
    JNZ r7, hm_clear_drag

    LDI r20, DRAG_WIN
    LOAD r7, r20
    CMPI r7, 0
    JZ r7, hm_clear_drag

    ; Move window: new_pos = mouse - offset
    LDI r20, DRAG_OX
    LOAD r14, r20
    LDI r20, DRAG_OY
    LOAD r11, r20
    SUB r12, r14
    SUB r10, r11
    ; WINSYS MOVETO (op=5): r7=win_id, r5=new_x, r6=new_y
    LDI r9, 5
    LDI r7, DRAG_WIN
    LOAD r7, r7
    WINSYS r9
    JMP hm_done

hm_clear_drag:
    LDI r20, DRAG_WIN
    LDI r7, 0
    STORE r20, r7

hm_done:
    POP r31
    RET

; =========================================
; DRAIN_PTY -- render PTY output as pixel bars
; =========================================
drain_pty:
    PUSH r31
    LDI r5, 1

    ; Check terminal window exists
    LDI r20, TERM_WIN
    LOAD r7, r20
    CMPI r7, 0
    JZ r7, dp_done

    ; Check PTY is valid
    LDI r20, PTY_HANDLE
    LOAD r7, r20
    CMPI r7, 0xFFFF
    JZ r7, dp_done

    ; Read from PTY (max 16 bytes per frame to stay responsive)
    LDI r10, PTY_RECV
    LDI r3, 16
    PTYREAD r28, r10, r3
    MOV r14, r7
    ; 0 = no data, 0xFFFFFFFF = PTY closed -> skip
    CMPI r14, 0
    JZ r7, dp_done
    CMPI r14, 0
    ; r14 != 0 here. Check for error (0xFFFFFFFF = -1 = all bits set)
    ; Use AND to check: if r14 == 0xFFFFFFFF, AND with itself stays same
    ; Simpler: just check if r14 > 4096 (our max read)
    LDI r7, 4097
    CMP r14, r7
    BGE r7, dp_done

    LDI r11, 0

dp_loop:
    CMP r11, r14
    BGE r7, dp_done

    ; Load byte
    LDI r20, PTY_RECV
    ADD r20, r11
    LOAD r12, r20

    ; --- ANSI escape stripping (two-state) ---
    ; State 0 = normal, State 1 = saw ESC, State 2 = saw ESC[ (CSI)
    ; Check if we're in an escape sequence
    LDI r20, ANSI_ESCAPE
    LOAD r7, r20
    CMPI r7, 0
    JNZ r7, dp_in_escape

    ; State 0: normal mode, check for ESC
dp_check_esc:
    CMPI r12, 27
    JNZ r7, dp_normal
    ; Saw ESC -> state 1
    LDI r20, ANSI_ESCAPE
    LDI r7, 1
    STORE r20, r7
    JMP dp_next

dp_in_escape:
    ; State 1 or 2
    CMPI r7, 2
    JZ r7, dp_csi_mode

    ; State 1: saw ESC, check for CSI introducer '['
    CMPI r12, 0x5B
    JZ r7, dp_enter_csi
    ; Not '[', check for single-char escape terminator (0x40-0x7E)
    CMPI r12, 0x40
    BLT r7, dp_next
    CMPI r12, 0x7F
    BGE r7, dp_next
    ; Terminator found (e.g. ESC M), clear state
    LDI r20, ANSI_ESCAPE
    LDI r7, 0
    STORE r20, r7
    JMP dp_next

dp_enter_csi:
    ; Saw ESC[, enter CSI mode (state 2)
    LDI r20, ANSI_ESCAPE
    LDI r7, 2
    STORE r20, r7
    JMP dp_next

dp_csi_mode:
    ; State 2: in CSI sequence, skip params until final byte (0x40-0x7E)
    CMPI r12, 0x40
    BLT r7, dp_next
    CMPI r12, 0x7F
    BGE r7, dp_next
    ; Final byte found, clear escape state
    LDI r20, ANSI_ESCAPE
    LDI r7, 0
    STORE r20, r7
    JMP dp_next

dp_normal:
    ; Newline?
    CMPI r12, 10
    JZ r7, dp_newline

    ; Carriage return?
    CMPI r12, 13
    JZ r7, dp_next

    ; Skip non-printable (< 32)
    CMPI r12, 32
    BLT r7, dp_next

    ; Skip DEL and above (> 126)
    CMPI r12, 127
    BGE r7, dp_next

    ; Printable! Draw vertical bar: height = byte - 30, cap at 80
    SUB r12, r5
    SUB r12, r5
    LDI r3, 80
    CMP r12, r3
    BLT r7, dp_height_ok
    MOV r12, r3

dp_height_ok:
    ; Read cursor position
    LDI r20, TERM_CUR_X
    LOAD r15, r20
    LDI r20, TERM_CUR_Y
    LOAD r2, r20

    ; Check if we've gone past window width (180)
    CMPI r15, 170
    BGE r7, dp_newline

    ; Draw bar pixels -- save r5 (used as constant 1)
    MOV r18, r5
    LDI r8, 0

dp_bar:
    CMP r8, r12
    BGE r7, dp_after_bar

    ; WPIXEL win_id, x, y, color
    LDI r7, TERM_WIN
    LOAD r7, r7
    MOV r5, r15
    MOV r6, r2
    ADD r6, r8
    ; Color: bright green
    LDI r9, 0x22CC22
    WPIXEL r7, r5, r6, r9

    ADD r8, r18
    LDI r5, 1
    JMP dp_bar

dp_after_bar:
    ; Advance x cursor
    LDI r20, TERM_CUR_X
    LOAD r7, r20
    ADD r7, r5
    STORE r20, r7
    JMP dp_next

dp_newline:
    ; Reset x, advance y
    LDI r20, TERM_CUR_X
    LDI r7, 0
    STORE r20, r7
    LDI r20, TERM_CUR_Y
    LOAD r7, r20
    ADD r7, r5
    STORE r20, r7

dp_next:
    ADD r11, r5
    LDI r5, 1
    JMP dp_loop

dp_done:
    POP r31
    RET

; =========================================
; UPDATE_SYSMON
; =========================================
update_sysmon:
    PUSH r31
    LDI r5, 1

    ; Check window exists
    LDI r20, SYSMON_WIN
    LOAD r7, r20
    CMPI r7, 0
    JZ r7, us_done

    ; Check dirty flag
    LDI r20, DIRTY_SYSMON
    LOAD r7, r20
    CMPI r7, 0
    JZ r7, us_done

    ; Clear dirty
    LDI r20, DIRTY_SYSMON
    LDI r7, 0
    STORE r20, r7

    ; Heartbeat bar (frame % 50), cyan, at y=2
    LDI r20, FRAME_COUNT
    LOAD r12, r20
    LDI r10, 50
    MOD r12, r10
    LDI r2, 0

us_bar:
    CMP r2, r12
    BGE r7, us_dots
    LDI r7, SYSMON_WIN
    LOAD r7, r7
    MOV r5, r2
    LDI r6, 2
    LDI r9, COL_CYAN
    WPIXEL r7, r5, r6, r9
    LDI r5, 1
    ADD r2, r5
    JMP us_bar

us_dots:
    ; Dot row (frame % 16), yellow, at y=8
    LDI r20, FRAME_COUNT
    LOAD r12, r20
    LDI r10, 16
    MOD r12, r10
    LDI r2, 0

us_dot_loop:
    CMP r2, r12
    BGE r7, us_draw_text
    LDI r7, SYSMON_WIN
    LOAD r7, r7
    MOV r5, r2
    LDI r6, 8
    LDI r9, COL_YELLOW
    WPIXEL r7, r5, r6, r9
    LDI r5, 1
    ADD r2, r5
    JMP us_dot_loop

us_draw_text:
    ; "GEOS" pixel art at (5, 25)
    LDI r4, 5
    LDI r16, 25
    CALL pxl_G
    ADD r4, r5
    ADD r4, r5
    ADD r4, r5
    ADD r4, r5
    CALL pxl_E
    ADD r4, r5
    ADD r4, r5
    ADD r4, r5
    ADD r4, r5
    CALL pxl_O
    ADD r4, r5
    ADD r4, r5
    ADD r4, r5
    ADD r4, r5
    CALL pxl_S

    ; Redirty every 30 frames
    LDI r20, BLINK_COUNT
    LOAD r7, r20
    LDI r10, 30
    MOD r7, r10
    CMPI r7, 0
    JNZ r7, us_done
    LDI r20, DIRTY_SYSMON
    LDI r7, 1
    STORE r20, r7

us_done:
    POP r31
    RET

; =========================================
; UPDATE_TASKBAR -- activity bar
; =========================================
update_taskbar:
    PUSH r31
    LDI r5, 1

    ; Only every 10 frames
    LDI r20, FRAME_COUNT
    LOAD r7, r20
    LDI r10, 10
    MOD r7, r10
    CMPI r7, 0
    JNZ r7, ut_done

    ; Bar width = frame % 100 at y=249
    LDI r20, FRAME_COUNT
    LOAD r12, r20
    LDI r10, 100
    MOD r12, r10
    ; Save loop limit in r18 (r12 will be clobbered by color LDI)
    MOV r18, r12
    LDI r2, 0

ut_bar:
    CMP r2, r18
    BGE r7, ut_done
    MOV r5, r2
    LDI r6, 249
    LDI r9, 1
    LDI r1, 5
    LDI r12, 0x444466
    RECTF r5, r6, r9, r1, r12
    LDI r5, 1
    ADD r2, r5
    JMP ut_bar

ut_done:
    POP r31
    RET

; =========================================
; PIXEL LETTER ROUTINES (3x5 each)
; Draw at (r4, r16) in sysmon window, green
; =========================================

pxl_G:
    PUSH r31
    LDI r5, 1
    LDI r7, SYSMON_WIN
    LOAD r7, r7
    LDI r9, COL_GREEN
    MOV r5, r4
    MOV r6, r16
    WPIXEL r7, r5, r6, r9
    ADD r4, r5
    WPIXEL r7, r4, r6, r9
    ADD r4, r5
    WPIXEL r7, r4, r6, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    SUB r4, r5
    SUB r4, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    POP r31
    RET

pxl_E:
    PUSH r31
    LDI r5, 1
    LDI r7, SYSMON_WIN
    LOAD r7, r7
    LDI r9, COL_GREEN
    MOV r5, r4
    MOV r6, r16
    WPIXEL r7, r5, r6, r9
    ADD r4, r5
    WPIXEL r7, r4, r6, r9
    ADD r4, r5
    WPIXEL r7, r4, r6, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    SUB r4, r5
    SUB r4, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    POP r31
    RET

pxl_O:
    PUSH r31
    LDI r5, 1
    LDI r7, SYSMON_WIN
    LOAD r7, r7
    LDI r9, COL_GREEN
    MOV r5, r4
    MOV r6, r16
    WPIXEL r7, r5, r6, r9
    ADD r4, r5
    WPIXEL r7, r4, r6, r9
    ADD r4, r5
    WPIXEL r7, r4, r6, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    SUB r4, r5
    SUB r4, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    POP r31
    RET

pxl_S:
    PUSH r31
    LDI r5, 1
    LDI r7, SYSMON_WIN
    LOAD r7, r7
    LDI r9, COL_GREEN
    MOV r5, r4
    MOV r6, r16
    ADD r4, r5
    WPIXEL r7, r4, r6, r9
    ADD r4, r5
    WPIXEL r7, r4, r6, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r16, r5
    SUB r4, r5
    SUB r4, r5
    WPIXEL r7, r4, r16, r9
    ADD r4, r5
    WPIXEL r7, r4, r16, r9
    SUB r4, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    POP r31
    RET
