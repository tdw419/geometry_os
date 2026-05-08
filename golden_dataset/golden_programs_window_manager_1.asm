; DESCRIPTION: A red object centered at the screen with fixed size.

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
LDI r15, 0x0A0A0A
FILL r15

; Desktop background (256 x 240)
LDI r5, 0
LDI r7, 0
LDI r6, 256
LDI r0, 240
LDI r14, COL_DESKTOP
RECTF r5, r7, r6, r0, r14

; Taskbar (256 x 16)
LDI r5, 0
LDI r7, 240
LDI r6, 256
LDI r0, 16
LDI r14, COL_TASKBAR
RECTF r5, r7, r6, r0, r14

; Taskbar label
LDI r20, TEMP_AREA
STRO r20, "Geometry OS"
LDI r5, 4
LDI r7, 243
LDI r6, TEMP_AREA
LDI r0, COL_GREEN
LDI r14, COL_TASKBAR
SMALLTEXT r5, r7, r6, r0, r14

; Init all variables to 0
LDI r20, TERM_WIN
LDI r15, 0
STORE r20, r15
LDI r20, SYSMON_WIN
STORE r20, r15
LDI r20, FOCUSED_WIN
STORE r20, r15
LDI r20, FRAME_COUNT
STORE r20, r15
LDI r20, DRAG_WIN
STORE r20, r15
LDI r20, BLINK_COUNT
STORE r20, r15
LDI r20, TERM_CUR_X
LDI r15, 0
STORE r20, r15
LDI r20, TERM_CUR_Y
LDI r15, 0
STORE r20, r15

; ANSI escape state: 0 = normal, 1 = in escape sequence
LDI r20, ANSI_ESCAPE
LDI r15, 0
STORE r20, r15

; PTY handle init to invalid
LDI r20, PTY_HANDLE
LDI r15, 0xFFFF
STORE r20, r15

; Dirty sysmon = start dirty
LDI r20, DIRTY_SYSMON
LDI r15, 1
STORE r20, r15

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
LDI r7, 6
LDI r6, 180
LDI r0, 168
LDI r14, TITLE_TERM
LDI r15, 0
WINSYS r15
; r15 = window_id
LDI r20, TERM_WIN
STORE r20, r15

; Monitor: x=192, y=6, w=60, h=100
LDI r5, 192
LDI r7, 6
LDI r6, 60
LDI r0, 100
LDI r14, TITLE_MON
LDI r15, 0
WINSYS r15
; r15 = window_id
LDI r20, SYSMON_WIN
STORE r20, r15

; Focus terminal by default
LDI r20, FOCUSED_WIN
LDI r15, TERM_WIN
LOAD r15, r15
STORE r20, r15

; =========================================
; OPEN PTY FOR TERMINAL
; =========================================

; Null-terminate send buffer
LDI r20, PTY_SEND
LDI r15, 0
STORE r20, r15

; Open PTY: PTYOPEN cmd_addr_reg, handle_reg
LDI r14, PTY_SEND
PTYOPEN r14, r2
; r2 = slot index (handle), r15 = status

; Store handle
LDI r20, PTY_HANDLE
STORE r20, r2

; Also keep a copy in r28 for PTYWRITE/PTYREAD
LDI r28, 0
ADD r28, r2

; Set PTY size 24x80
LDI r13, 24
LDI r9, 80
PTYSIZE r28, r13, r9

; Send "clear" to PTY
LDI r20, PTY_SEND
STRO r20, "clear\n"
LDI r11, PTY_SEND
LDI r8, 6
PTYWRITE r28, r11, r8

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
    LOAD r15, r20
    ADD r15, r5
    STORE r20, r15

    LDI r20, FRAME_COUNT
    LOAD r15, r20
    ADD r15, r5
    STORE r20, r15

    FRAME

    ; Keyboard -> PTY if terminal focused
    IKEY r14
    JZ r14, main_loop

    LDI r20, FOCUSED_WIN
    LOAD r15, r20
    LDI r20, TERM_WIN
    LOAD r20, r20
    CMP r15, r20
    JNZ r15, main_loop

    ; Forward key to PTY
    LDI r20, PTY_SEND
    STORE r20, r14
    LDI r11, PTY_SEND
    LDI r8, 1
    PTYWRITE r28, r11, r8
    JMP main_loop

; =========================================
; HANDLE_MOUSE
; =========================================
handle_mouse:
    PUSH r31
    LDI r5, 1

    MOUSEQ r14
    ; r14=mx, r11=my, r8=btn

    ; Click (btn==2)
    CMPI r8, 2
    JNZ r15, hm_check_drag

    ; WINSYS HITTEST (op=4): r15=win_id, r5=hit_type
    LDI r15, 4
    WINSYS r15
    CMPI r15, 0
    JZ r15, hm_clear_drag

    ; hit_type 3 = close button
    CMPI r5, 3
    JNZ r15, hm_check_title
    ; Destroy window
    LDI r15, 1
    WINSYS r15
    ; Clear focus if we closed the focused window
    LDI r20, FOCUSED_WIN
    LDI r15, 0
    STORE r20, r15
    JMP hm_done

hm_check_title:
    ; hit_type 1 = title bar
    CMPI r5, 1
    JNZ r15, hm_check_body

    ; Focus + bring to front
    LDI r20, FOCUSED_WIN
    STORE r20, r15
    LDI r15, 2
    WINSYS r15

    ; Start drag: save win_id and mouse offset
    LDI r20, DRAG_WIN
    LDI r15, FOCUSED_WIN
    LOAD r15, r15
    STORE r20, r15

    ; Get window position via WINFO (op=6)
    LDI r15, 6
    LDI r5, TEMP_AREA
    WINSYS r15
    ; TEMP_AREA[0]=x, TEMP_AREA[1]=y
    LDI r20, TEMP_AREA
    LOAD r3, r20
    ADD r20, r5
    LOAD r1, r20
    SUB r3, r14
    SUB r1, r11
    LDI r20, DRAG_OX
    STORE r20, r3
    LDI r20, DRAG_OY
    STORE r20, r1
    JMP hm_done

hm_check_body:
    ; hit_type 2 = body -> focus only
    LDI r20, FOCUSED_WIN
    STORE r20, r15
    LDI r15, 2
    WINSYS r15
    JMP hm_done

hm_check_drag:
    ; btn==1 (held down) -> drag if active
    CMPI r8, 1
    JNZ r15, hm_clear_drag

    LDI r20, DRAG_WIN
    LOAD r15, r20
    CMPI r15, 0
    JZ r15, hm_clear_drag

    ; Move window: new_pos = mouse - offset
    LDI r20, DRAG_OX
    LOAD r3, r20
    LDI r20, DRAG_OY
    LOAD r1, r20
    SUB r14, r3
    SUB r11, r1
    ; WINSYS MOVETO (op=5): r15=win_id, r5=new_x, r7=new_y
    LDI r6, 5
    LDI r15, DRAG_WIN
    LOAD r15, r15
    WINSYS r6
    JMP hm_done

hm_clear_drag:
    LDI r20, DRAG_WIN
    LDI r15, 0
    STORE r20, r15

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
    LOAD r15, r20
    CMPI r15, 0
    JZ r15, dp_done

    ; Check PTY is valid
    LDI r20, PTY_HANDLE
    LOAD r15, r20
    CMPI r15, 0xFFFF
    JZ r15, dp_done

    ; Read from PTY (max 16 bytes per frame to stay responsive)
    LDI r11, PTY_RECV
    LDI r8, 16
    PTYREAD r28, r11, r8
    MOV r3, r15
    ; 0 = no data, 0xFFFFFFFF = PTY closed -> skip
    CMPI r3, 0
    JZ r15, dp_done
    CMPI r3, 0
    ; r3 != 0 here. Check for error (0xFFFFFFFF = -1 = all bits set)
    ; Use AND to check: if r3 == 0xFFFFFFFF, AND with itself stays same
    ; Simpler: just check if r3 > 4096 (our max read)
    LDI r15, 4097
    CMP r3, r15
    BGE r15, dp_done

    LDI r1, 0

dp_loop:
    CMP r1, r3
    BGE r15, dp_done

    ; Load byte
    LDI r20, PTY_RECV
    ADD r20, r1
    LOAD r14, r20

    ; --- ANSI escape stripping (two-state) ---
    ; State 0 = normal, State 1 = saw ESC, State 2 = saw ESC[ (CSI)
    ; Check if we're in an escape sequence
    LDI r20, ANSI_ESCAPE
    LOAD r15, r20
    CMPI r15, 0
    JNZ r15, dp_in_escape

    ; State 0: normal mode, check for ESC
dp_check_esc:
    CMPI r14, 27
    JNZ r15, dp_normal
    ; Saw ESC -> state 1
    LDI r20, ANSI_ESCAPE
    LDI r15, 1
    STORE r20, r15
    JMP dp_next

dp_in_escape:
    ; State 1 or 2
    CMPI r15, 2
    JZ r15, dp_csi_mode

    ; State 1: saw ESC, check for CSI introducer '['
    CMPI r14, 0x5B
    JZ r15, dp_enter_csi
    ; Not '[', check for single-char escape terminator (0x40-0x7E)
    CMPI r14, 0x40
    BLT r15, dp_next
    CMPI r14, 0x7F
    BGE r15, dp_next
    ; Terminator found (e.g. ESC M), clear state
    LDI r20, ANSI_ESCAPE
    LDI r15, 0
    STORE r20, r15
    JMP dp_next

dp_enter_csi:
    ; Saw ESC[, enter CSI mode (state 2)
    LDI r20, ANSI_ESCAPE
    LDI r15, 2
    STORE r20, r15
    JMP dp_next

dp_csi_mode:
    ; State 2: in CSI sequence, skip params until final byte (0x40-0x7E)
    CMPI r14, 0x40
    BLT r15, dp_next
    CMPI r14, 0x7F
    BGE r15, dp_next
    ; Final byte found, clear escape state
    LDI r20, ANSI_ESCAPE
    LDI r15, 0
    STORE r20, r15
    JMP dp_next

dp_normal:
    ; Newline?
    CMPI r14, 10
    JZ r15, dp_newline

    ; Carriage return?
    CMPI r14, 13
    JZ r15, dp_next

    ; Skip non-printable (< 32)
    CMPI r14, 32
    BLT r15, dp_next

    ; Skip DEL and above (> 126)
    CMPI r14, 127
    BGE r15, dp_next

    ; Printable! Draw vertical bar: height = byte - 30, cap at 80
    SUB r14, r5
    SUB r14, r5
    LDI r8, 80
    CMP r14, r8
    BLT r15, dp_height_ok
    MOV r14, r8

dp_height_ok:
    ; Read cursor position
    LDI r20, TERM_CUR_X
    LOAD r2, r20
    LDI r20, TERM_CUR_Y
    LOAD r13, r20

    ; Check if we've gone past window width (180)
    CMPI r2, 170
    BGE r15, dp_newline

    ; Draw bar pixels -- save r5 (used as constant 1)
    MOV r18, r5
    LDI r9, 0

dp_bar:
    CMP r9, r14
    BGE r15, dp_after_bar

    ; WPIXEL win_id, x, y, color
    LDI r15, TERM_WIN
    LOAD r15, r15
    MOV r5, r2
    MOV r7, r13
    ADD r7, r9
    ; Color: bright green
    LDI r6, 0x22CC22
    WPIXEL r15, r5, r7, r6

    ADD r9, r18
    LDI r5, 1
    JMP dp_bar

dp_after_bar:
    ; Advance x cursor
    LDI r20, TERM_CUR_X
    LOAD r15, r20
    ADD r15, r5
    STORE r20, r15
    JMP dp_next

dp_newline:
    ; Reset x, advance y
    LDI r20, TERM_CUR_X
    LDI r15, 0
    STORE r20, r15
    LDI r20, TERM_CUR_Y
    LOAD r15, r20
    ADD r15, r5
    STORE r20, r15

dp_next:
    ADD r1, r5
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
    LOAD r15, r20
    CMPI r15, 0
    JZ r15, us_done

    ; Check dirty flag
    LDI r20, DIRTY_SYSMON
    LOAD r15, r20
    CMPI r15, 0
    JZ r15, us_done

    ; Clear dirty
    LDI r20, DIRTY_SYSMON
    LDI r15, 0
    STORE r20, r15

    ; Heartbeat bar (frame % 50), cyan, at y=2
    LDI r20, FRAME_COUNT
    LOAD r14, r20
    LDI r11, 50
    MOD r14, r11
    LDI r13, 0

us_bar:
    CMP r13, r14
    BGE r15, us_dots
    LDI r15, SYSMON_WIN
    LOAD r15, r15
    MOV r5, r13
    LDI r7, 2
    LDI r6, COL_CYAN
    WPIXEL r15, r5, r7, r6
    LDI r5, 1
    ADD r13, r5
    JMP us_bar

us_dots:
    ; Dot row (frame % 16), yellow, at y=8
    LDI r20, FRAME_COUNT
    LOAD r14, r20
    LDI r11, 16
    MOD r14, r11
    LDI r13, 0

us_dot_loop:
    CMP r13, r14
    BGE r15, us_draw_text
    LDI r15, SYSMON_WIN
    LOAD r15, r15
    MOV r5, r13
    LDI r7, 8
    LDI r6, COL_YELLOW
    WPIXEL r15, r5, r7, r6
    LDI r5, 1
    ADD r13, r5
    JMP us_dot_loop

us_draw_text:
    ; "GEOS" pixel art at (5, 25)
    LDI r10, 5
    LDI r16, 25
    CALL pxl_G
    ADD r10, r5
    ADD r10, r5
    ADD r10, r5
    ADD r10, r5
    CALL pxl_E
    ADD r10, r5
    ADD r10, r5
    ADD r10, r5
    ADD r10, r5
    CALL pxl_O
    ADD r10, r5
    ADD r10, r5
    ADD r10, r5
    ADD r10, r5
    CALL pxl_S

    ; Redirty every 30 frames
    LDI r20, BLINK_COUNT
    LOAD r15, r20
    LDI r11, 30
    MOD r15, r11
    CMPI r15, 0
    JNZ r15, us_done
    LDI r20, DIRTY_SYSMON
    LDI r15, 1
    STORE r20, r15

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
    LOAD r15, r20
    LDI r11, 10
    MOD r15, r11
    CMPI r15, 0
    JNZ r15, ut_done

    ; Bar width = frame % 100 at y=249
    LDI r20, FRAME_COUNT
    LOAD r14, r20
    LDI r11, 100
    MOD r14, r11
    ; Save loop limit in r18 (r14 will be clobbered by color LDI)
    MOV r18, r14
    LDI r13, 0

ut_bar:
    CMP r13, r18
    BGE r15, ut_done
    MOV r5, r13
    LDI r7, 249
    LDI r6, 1
    LDI r0, 5
    LDI r14, 0x444466
    RECTF r5, r7, r6, r0, r14
    LDI r5, 1
    ADD r13, r5
    JMP ut_bar

ut_done:
    POP r31
    RET

; =========================================
; PIXEL LETTER ROUTINES (3x5 each)
; Draw at (r10, r16) in sysmon window, green
; =========================================

pxl_G:
    PUSH r31
    LDI r5, 1
    LDI r15, SYSMON_WIN
    LOAD r15, r15
    LDI r6, COL_GREEN
    MOV r5, r10
    MOV r7, r16
    WPIXEL r15, r5, r7, r6
    ADD r10, r5
    WPIXEL r15, r10, r7, r6
    ADD r10, r5
    WPIXEL r15, r10, r7, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    SUB r10, r5
    SUB r10, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    POP r31
    RET

pxl_E:
    PUSH r31
    LDI r5, 1
    LDI r15, SYSMON_WIN
    LOAD r15, r15
    LDI r6, COL_GREEN
    MOV r5, r10
    MOV r7, r16
    WPIXEL r15, r5, r7, r6
    ADD r10, r5
    WPIXEL r15, r10, r7, r6
    ADD r10, r5
    WPIXEL r15, r10, r7, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    SUB r10, r5
    SUB r10, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    POP r31
    RET

pxl_O:
    PUSH r31
    LDI r5, 1
    LDI r15, SYSMON_WIN
    LOAD r15, r15
    LDI r6, COL_GREEN
    MOV r5, r10
    MOV r7, r16
    WPIXEL r15, r5, r7, r6
    ADD r10, r5
    WPIXEL r15, r10, r7, r6
    ADD r10, r5
    WPIXEL r15, r10, r7, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    SUB r10, r5
    SUB r10, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    POP r31
    RET

pxl_S:
    PUSH r31
    LDI r5, 1
    LDI r15, SYSMON_WIN
    LOAD r15, r15
    LDI r6, COL_GREEN
    MOV r5, r10
    MOV r7, r16
    ADD r10, r5
    WPIXEL r15, r10, r7, r6
    ADD r10, r5
    WPIXEL r15, r10, r7, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r16, r5
    SUB r10, r5
    SUB r10, r5
    WPIXEL r15, r10, r16, r6
    ADD r10, r5
    WPIXEL r15, r10, r16, r6
    SUB r10, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    SUB r16, r5
    POP r31
    RET
