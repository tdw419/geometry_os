; DESCRIPTION: Render a colored object at the screen.

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
LDI r15, 1

; Init selected PID
LDI r5, 0
LDI r20, SEL_PID
STORE r20, r5

; =========================================
; Main loop
; =========================================
main_loop:
    ; Clear screen
    LDI r15, C_BG
    FILL r15

    ; Title bar
    LDI r15, 0
    LDI r2, 0
    LDI r14, 256
    LDI r12, 20
    LDI r11, C_TITLE
    RECTF r15, r2, r14, r12, r11

    ; Title
    LDI r20, BUF
    STRO r20, "Process Monitor"
    LDI r15, 56
    LDI r2, 4
    LDI r14, BUF
    LDI r12, C_FG
    LDI r11, C_TITLE
    DRAWTEXT r15, r2, r14, r12, r11

    ; Column headers
    LDI r20, BUF
    STRO r20, "PID State  PC    Pri Pg"
    LDI r15, 4
    LDI r2, 22
    LDI r14, BUF
    LDI r12, C_LABEL
    LDI r11, 0
    DRAWTEXT r15, r2, r14, r12, r11

    ; Separator line
    LDI r15, 4
    LDI r2, 32
    LDI r14, 248
    LDI r12, 1
    LDI r11, C_LABEL
    RECTF r15, r2, r14, r12, r11

    ; Get process count
    NPROC
    MOV r0, r6          ; r0 = total count

    ; Draw process rows (up to 10 visible)
    LDI r13, 0           ; current PID
row_loop:
    CMP r13, r0
    BGE r6, rows_done

    ; Compute screen Y: 36 + PID * 18
    LDI r5, 18
    MOV r26, r13
    MUL r26, r5
    ADD r26, r5         ; r5 still 18, so add 36 total
    ; Actually: 36 + pid*18
    LDI r5, 36
    ADD r26, r5

    ; Check if off screen
    LDI r5, 230
    CMP r26, r5
    BGE r6, rows_done

    ; Check if selected
    LDI r20, SEL_PID
    LOAD r25, r20
    CMP r13, r25
    JNZ r6, not_sel

    ; Highlight row
    LDI r15, 4
    MOV r2, r26
    LDI r14, 248
    LDI r12, 16
    LDI r11, C_SEL
    RECTF r15, r2, r14, r12, r11
    JMP draw_pid

not_sel:
    ; Normal row
    LDI r15, 4
    MOV r2, r26
    LDI r14, 248
    LDI r12, 16
    LDI r11, 0x141428
    RECTF r15, r2, r14, r12, r11

draw_pid:
    ; Draw PID number
    MOV r3, r13
    LDI r20, BUF
    CALL int_to_str
    LDI r15, 8
    LDI r5, 4
    MOV r2, r26
    ADD r2, r5
    LDI r14, BUF
    LDI r12, C_CYAN
    LDI r11, 0
    DRAWTEXT r15, r2, r14, r12, r11

    ; Get state (field 0)
    MOV r15, r13
    LDI r2, 0
    PROCINFO r15, r2
    MOV r3, r6

    ; Draw state name
    LDI r20, BUF
    LDI r5, 0
    CMP r3, r5
    JNZ r6, chk_s1
    STRO r20, "Ready"
    LDI r5, C_GREEN
    JMP draw_st
chk_s1:
    LDI r5, 1
    CMP r3, r5
    JNZ r6, chk_s2
    STRO r20, "Run"
    LDI r5, C_GREEN
    JMP draw_st
chk_s2:
    LDI r5, 2
    CMP r3, r5
    JNZ r6, chk_s3
    STRO r20, "Sleep"
    LDI r5, C_YELLOW
    JMP draw_st
chk_s3:
    LDI r5, 3
    CMP r3, r5
    JNZ r6, chk_s4
    STRO r20, "Block"
    LDI r5, C_YELLOW
    JMP draw_st
chk_s4:
    LDI r5, 4
    CMP r3, r5
    JNZ r6, chk_s5
    STRO r20, "Zombie"
    LDI r5, C_RED
    JMP draw_st
chk_s5:
    STRO r20, "???"
    LDI r5, C_GRAY

draw_st:
    LDI r15, 38
    LDI r16, 4
    MOV r2, r26
    ADD r2, r16
    LDI r14, BUF
    MOV r12, r5
    LDI r11, 0
    DRAWTEXT r15, r2, r14, r12, r11

    ; Get PC (field 1)
    MOV r15, r13
    LDI r2, 1
    PROCINFO r15, r2
    MOV r3, r6

    ; Draw PC as decimal
    LDI r20, BUF
    CALL int_to_str
    LDI r15, 88
    LDI r16, 4
    MOV r2, r26
    ADD r2, r16
    LDI r14, BUF
    LDI r12, C_FG
    LDI r11, 0
    DRAWTEXT r15, r2, r14, r12, r11

    ; Get priority (field 2)
    MOV r15, r13
    LDI r2, 2
    PROCINFO r15, r2
    MOV r3, r6
    LDI r20, BUF
    CALL int_to_str
    LDI r15, 150
    LDI r16, 4
    MOV r2, r26
    ADD r2, r16
    LDI r14, BUF
    LDI r12, C_FG
    LDI r11, 0
    DRAWTEXT r15, r2, r14, r12, r11

    ; Get pages (field 4)
    MOV r15, r13
    LDI r2, 4
    PROCINFO r15, r2
    MOV r3, r6
    LDI r20, BUF
    CALL int_to_str
    LDI r15, 180
    LDI r16, 4
    MOV r2, r26
    ADD r2, r16
    LDI r14, BUF
    LDI r12, C_FG
    LDI r11, 0
    DRAWTEXT r15, r2, r14, r12, r11

    ; Next PID
    LDI r5, 1
    ADD r13, r5
    JMP row_loop

rows_done:
    ; Footer bar
    LDI r15, 0
    LDI r2, 236
    LDI r14, 256
    LDI r12, 20
    LDI r11, C_TITLE
    RECTF r15, r2, r14, r12, r11

    ; Footer help
    LDI r20, BUF
    STRO r20, "W/S:Scroll K:Kill Q:Quit"
    LDI r15, 16
    LDI r2, 242
    LDI r14, BUF
    LDI r12, C_GRAY
    LDI r11, C_TITLE
    DRAWTEXT r15, r2, r14, r12, r11

    ; Process count
    MOV r3, r0
    LDI r20, BUF
    STRO r20, "Total:"
    LDI r15, 200
    LDI r2, 242
    LDI r14, BUF
    LDI r12, C_GRAY
    LDI r11, C_TITLE
    DRAWTEXT r15, r2, r14, r12, r11

    MOV r3, r0
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r15, 235
    LDI r2, 242
    LDI r14, NUMBUF
    LDI r12, C_CYAN
    LDI r11, C_TITLE
    DRAWTEXT r15, r2, r14, r12, r11

    ; Handle input
    IKEY r5
    JZ r5, no_input

    ; W = 87 (scroll up / prev)
    LDI r16, 87
    CMP r5, r16
    JNZ r6, chk_s_down
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
    CMP r5, r16
    JNZ r6, chk_kill
    LDI r20, SEL_PID
    LOAD r16, r20
    LDI r17, 1
    ADD r16, r17
    CMP r16, r0
    BGE r6, no_input
    STORE r20, r16
    JMP no_input

chk_kill:
    ; K = 75 (kill)
    LDI r16, 75
    CMP r5, r16
    JNZ r6, chk_quit
    LDI r20, SEL_PID
    LOAD r16, r20
    JZ r16, no_input
    MOV r15, r16
    KILL r15
    JMP no_input

chk_quit:
    ; Q = 81 (quit)
    LDI r16, 81
    CMP r5, r16
    JNZ r6, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r3 (u32) to decimal string at r20
; Returns null-terminated. r6 = buffer start.
; Clobbers r3-r19.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r3, its_zero

its_loop:
    MOV r18, r3
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r3, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r3, its_loop

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
    POP r6
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r6
    POP r31
    RET
