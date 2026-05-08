; DESCRIPTION: Draws a colored object at the screen with fixed size.

; procmon.asm -- Process Monitor for Geometry OS (Phase 140)
;
; Shows: all GeOS processes with PID, State, PC, Priority, Pages
; Interactive: W/S scrolls, K kills selected process, Q quits
; Updates every frame via NPROC + PROCINFO opcodes.
;
; RAM Layout:
;   0x6000-0x60FF  String buffers
;   0x6100-0x61FF  Number conversion buffer
;   0x6200         Selected PID (u32)
;
; Uses: NPROC, PROCINFO, DRAWTEXT, RECTF, FILL, FRAME, IKEY, KILL, STRO

#define TICKS   0xFFE
#define BUF     0x6000
#define NUMBUF  0x6100
#define SEL_PID 0x6200

; Colors
#define C_BG    0x0D1B2A
#define C_TITLE 0x1B3A5C
#define C_PANEL 0x1B2838
#define C_FG    0xFFFFFF
#define C_LABEL 0x8888CC
#define C_GREEN 0x44FF44
#define C_YELLOW 0xFFFF44
#define C_RED    0xFF4444
#define C_CYAN   0x44FFFF
#define C_GRAY   0x666688
#define C_SEL    0x334466

; Init
LDI r30, 0xFD00
LDI r4, 1

; Init selected PID
LDI r9, 0
LDI r20, SEL_PID
STORE r20, r9

; =========================================
; Main loop
; =========================================
main_loop:
    ; Clear screen
    LDI r4, C_BG
    FILL r4

    ; Title bar
    LDI r4, 0
    LDI r15, 0
    LDI r1, 256
    LDI r12, 20
    LDI r13, C_TITLE
    RECTF r4, r15, r1, r12, r13

    ; Title
    LDI r20, BUF
    STRO r20, "Process Monitor"
    LDI r4, 56
    LDI r15, 4
    LDI r1, BUF
    LDI r12, C_FG
    LDI r13, C_TITLE
    DRAWTEXT r4, r15, r1, r12, r13

    ; Column headers
    LDI r20, BUF
    STRO r20, "PID State  PC    Pri Pg"
    LDI r4, 4
    LDI r15, 22
    LDI r1, BUF
    LDI r12, C_LABEL
    LDI r13, 0
    DRAWTEXT r4, r15, r1, r12, r13

    ; Separator line
    LDI r4, 4
    LDI r15, 32
    LDI r1, 248
    LDI r12, 1
    LDI r13, C_LABEL
    RECTF r4, r15, r1, r12, r13

    ; Get process count
    NPROC
    MOV r11, r0          ; r11 = total count

    ; Draw process rows (up to 10 visible)
    LDI r2, 0           ; current PID
row_loop:
    CMP r2, r11
    BGE r0, rows_done

    ; Compute screen Y: 36 + PID * 18
    LDI r9, 18
    MOV r26, r2
    MUL r26, r9
    ADD r26, r9         ; r9 still 18, so add 36 total
    ; Actually: 36 + pid*18
    LDI r9, 36
    ADD r26, r9

    ; Check if off screen
    LDI r9, 230
    CMP r26, r9
    BGE r0, rows_done

    ; Check if selected
    LDI r20, SEL_PID
    LOAD r25, r20
    CMP r2, r25
    JNZ r0, not_sel

    ; Highlight row
    LDI r4, 4
    MOV r15, r26
    LDI r1, 248
    LDI r12, 16
    LDI r13, C_SEL
    RECTF r4, r15, r1, r12, r13
    JMP draw_pid

not_sel:
    ; Normal row
    LDI r4, 4
    MOV r15, r26
    LDI r1, 248
    LDI r12, 16
    LDI r13, 0x141428
    RECTF r4, r15, r1, r12, r13

draw_pid:
    ; Draw PID number
    MOV r14, r2
    LDI r20, BUF
    CALL int_to_str
    LDI r4, 8
    LDI r9, 4
    MOV r15, r26
    ADD r15, r9
    LDI r1, BUF
    LDI r12, C_CYAN
    LDI r13, 0
    DRAWTEXT r4, r15, r1, r12, r13

    ; Get state (field 0)
    MOV r4, r2
    LDI r15, 0
    PROCINFO r4, r15
    MOV r14, r0

    ; Draw state name
    LDI r20, BUF
    LDI r9, 0
    CMP r14, r9
    JNZ r0, chk_s1
    STRO r20, "Ready"
    LDI r9, C_GREEN
    JMP draw_st
chk_s1:
    LDI r9, 1
    CMP r14, r9
    JNZ r0, chk_s2
    STRO r20, "Run"
    LDI r9, C_GREEN
    JMP draw_st
chk_s2:
    LDI r9, 2
    CMP r14, r9
    JNZ r0, chk_s3
    STRO r20, "Sleep"
    LDI r9, C_YELLOW
    JMP draw_st
chk_s3:
    LDI r9, 3
    CMP r14, r9
    JNZ r0, chk_s4
    STRO r20, "Block"
    LDI r9, C_YELLOW
    JMP draw_st
chk_s4:
    LDI r9, 4
    CMP r14, r9
    JNZ r0, chk_s5
    STRO r20, "Zombie"
    LDI r9, C_RED
    JMP draw_st
chk_s5:
    STRO r20, "???"
    LDI r9, C_GRAY

draw_st:
    LDI r4, 38
    LDI r16, 4
    MOV r15, r26
    ADD r15, r16
    LDI r1, BUF
    MOV r12, r9
    LDI r13, 0
    DRAWTEXT r4, r15, r1, r12, r13

    ; Get PC (field 1)
    MOV r4, r2
    LDI r15, 1
    PROCINFO r4, r15
    MOV r14, r0

    ; Draw PC as decimal
    LDI r20, BUF
    CALL int_to_str
    LDI r4, 88
    LDI r16, 4
    MOV r15, r26
    ADD r15, r16
    LDI r1, BUF
    LDI r12, C_FG
    LDI r13, 0
    DRAWTEXT r4, r15, r1, r12, r13

    ; Get priority (field 2)
    MOV r4, r2
    LDI r15, 2
    PROCINFO r4, r15
    MOV r14, r0
    LDI r20, BUF
    CALL int_to_str
    LDI r4, 150
    LDI r16, 4
    MOV r15, r26
    ADD r15, r16
    LDI r1, BUF
    LDI r12, C_FG
    LDI r13, 0
    DRAWTEXT r4, r15, r1, r12, r13

    ; Get pages (field 4)
    MOV r4, r2
    LDI r15, 4
    PROCINFO r4, r15
    MOV r14, r0
    LDI r20, BUF
    CALL int_to_str
    LDI r4, 180
    LDI r16, 4
    MOV r15, r26
    ADD r15, r16
    LDI r1, BUF
    LDI r12, C_FG
    LDI r13, 0
    DRAWTEXT r4, r15, r1, r12, r13

    ; Next PID
    LDI r9, 1
    ADD r2, r9
    JMP row_loop

rows_done:
    ; Footer bar
    LDI r4, 0
    LDI r15, 236
    LDI r1, 256
    LDI r12, 20
    LDI r13, C_TITLE
    RECTF r4, r15, r1, r12, r13

    ; Footer help
    LDI r20, BUF
    STRO r20, "W/S:Scroll K:Kill Q:Quit"
    LDI r4, 16
    LDI r15, 242
    LDI r1, BUF
    LDI r12, C_GRAY
    LDI r13, C_TITLE
    DRAWTEXT r4, r15, r1, r12, r13

    ; Process count
    MOV r14, r11
    LDI r20, BUF
    STRO r20, "Total:"
    LDI r4, 200
    LDI r15, 242
    LDI r1, BUF
    LDI r12, C_GRAY
    LDI r13, C_TITLE
    DRAWTEXT r4, r15, r1, r12, r13

    MOV r14, r11
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r4, 235
    LDI r15, 242
    LDI r1, NUMBUF
    LDI r12, C_CYAN
    LDI r13, C_TITLE
    DRAWTEXT r4, r15, r1, r12, r13

    ; Handle input
    IKEY r9
    JZ r9, no_input

    ; W = 87 (scroll up / prev)
    LDI r16, 87
    CMP r9, r16
    JNZ r0, chk_s_down
    LDI r20, SEL_PID
    LOAD r16, r20
    JZ r16, no_input
    LDI r17, 1
    SUB r16, r17
    STORE r20, r16
    JMP no_input

chk_s_down:
    ; S = 83 (scroll down / next)
    LDI r16, 83
    CMP r9, r16
    JNZ r0, chk_kill
    LDI r20, SEL_PID
    LOAD r16, r20
    LDI r17, 1
    ADD r16, r17
    CMP r16, r11
    BGE r0, no_input
    STORE r20, r16
    JMP no_input

chk_kill:
    ; K = 75 (kill)
    LDI r16, 75
    CMP r9, r16
    JNZ r0, chk_quit
    LDI r20, SEL_PID
    LOAD r16, r20
    JZ r16, no_input
    MOV r4, r16
    KILL r4
    JMP no_input

chk_quit:
    ; Q = 81 (quit)
    LDI r16, 81
    CMP r9, r16
    JNZ r0, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r14 (u32) to decimal string at r20
; Returns null-terminated. r0 = buffer start.
; Clobbers r14-r19.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r14, its_zero

its_loop:
    MOV r18, r14
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r14, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r14, its_loop

its_write:
    POP r18
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r19, 1
    SUB r16, r19
    JNZ r16, its_write

    LDI r18, 0
    STORE r20, r18
    POP r0
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r0
    POP r31
    RET
