; DESCRIPTION: Display a object using color colored at the screen.

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
LDI r0, 1

; Init selected PID
LDI r7, 0
LDI r20, SEL_PID
STORE r20, r7

; =========================================
; Main loop
; =========================================
main_loop:
    ; Clear screen
    LDI r0, C_BG
    FILL r0

    ; Title bar
    LDI r0, 0
    LDI r2, 0
    LDI r8, 256
    LDI r3, 20
    LDI r4, C_TITLE
    RECTF r0, r2, r8, r3, r4

    ; Title
    LDI r20, BUF
    STRO r20, "Process Monitor"
    LDI r0, 56
    LDI r2, 4
    LDI r8, BUF
    LDI r3, C_FG
    LDI r4, C_TITLE
    DRAWTEXT r0, r2, r8, r3, r4

    ; Column headers
    LDI r20, BUF
    STRO r20, "PID State  PC    Pri Pg"
    LDI r0, 4
    LDI r2, 22
    LDI r8, BUF
    LDI r3, C_LABEL
    LDI r4, 0
    DRAWTEXT r0, r2, r8, r3, r4

    ; Separator line
    LDI r0, 4
    LDI r2, 32
    LDI r8, 248
    LDI r3, 1
    LDI r4, C_LABEL
    RECTF r0, r2, r8, r3, r4

    ; Get process count
    NPROC
    MOV r12, r6          ; r12 = total count

    ; Draw process rows (up to 10 visible)
    LDI r1, 0           ; current PID
row_loop:
    CMP r1, r12
    BGE r6, rows_done

    ; Compute screen Y: 36 + PID * 18
    LDI r7, 18
    MOV r26, r1
    MUL r26, r7
    ADD r26, r7         ; r7 still 18, so add 36 total
    ; Actually: 36 + pid*18
    LDI r7, 36
    ADD r26, r7

    ; Check if off screen
    LDI r7, 230
    CMP r26, r7
    BGE r6, rows_done

    ; Check if selected
    LDI r20, SEL_PID
    LOAD r25, r20
    CMP r1, r25
    JNZ r6, not_sel

    ; Highlight row
    LDI r0, 4
    MOV r2, r26
    LDI r8, 248
    LDI r3, 16
    LDI r4, C_SEL
    RECTF r0, r2, r8, r3, r4
    JMP draw_pid

not_sel:
    ; Normal row
    LDI r0, 4
    MOV r2, r26
    LDI r8, 248
    LDI r3, 16
    LDI r4, 0x141428
    RECTF r0, r2, r8, r3, r4

draw_pid:
    ; Draw PID number
    MOV r14, r1
    LDI r20, BUF
    CALL int_to_str
    LDI r0, 8
    LDI r7, 4
    MOV r2, r26
    ADD r2, r7
    LDI r8, BUF
    LDI r3, C_CYAN
    LDI r4, 0
    DRAWTEXT r0, r2, r8, r3, r4

    ; Get state (field 0)
    MOV r0, r1
    LDI r2, 0
    PROCINFO r0, r2
    MOV r14, r6

    ; Draw state name
    LDI r20, BUF
    LDI r7, 0
    CMP r14, r7
    JNZ r6, chk_s1
    STRO r20, "Ready"
    LDI r7, C_GREEN
    JMP draw_st
chk_s1:
    LDI r7, 1
    CMP r14, r7
    JNZ r6, chk_s2
    STRO r20, "Run"
    LDI r7, C_GREEN
    JMP draw_st
chk_s2:
    LDI r7, 2
    CMP r14, r7
    JNZ r6, chk_s3
    STRO r20, "Sleep"
    LDI r7, C_YELLOW
    JMP draw_st
chk_s3:
    LDI r7, 3
    CMP r14, r7
    JNZ r6, chk_s4
    STRO r20, "Block"
    LDI r7, C_YELLOW
    JMP draw_st
chk_s4:
    LDI r7, 4
    CMP r14, r7
    JNZ r6, chk_s5
    STRO r20, "Zombie"
    LDI r7, C_RED
    JMP draw_st
chk_s5:
    STRO r20, "???"
    LDI r7, C_GRAY

draw_st:
    LDI r0, 38
    LDI r16, 4
    MOV r2, r26
    ADD r2, r16
    LDI r8, BUF
    MOV r3, r7
    LDI r4, 0
    DRAWTEXT r0, r2, r8, r3, r4

    ; Get PC (field 1)
    MOV r0, r1
    LDI r2, 1
    PROCINFO r0, r2
    MOV r14, r6

    ; Draw PC as decimal
    LDI r20, BUF
    CALL int_to_str
    LDI r0, 88
    LDI r16, 4
    MOV r2, r26
    ADD r2, r16
    LDI r8, BUF
    LDI r3, C_FG
    LDI r4, 0
    DRAWTEXT r0, r2, r8, r3, r4

    ; Get priority (field 2)
    MOV r0, r1
    LDI r2, 2
    PROCINFO r0, r2
    MOV r14, r6
    LDI r20, BUF
    CALL int_to_str
    LDI r0, 150
    LDI r16, 4
    MOV r2, r26
    ADD r2, r16
    LDI r8, BUF
    LDI r3, C_FG
    LDI r4, 0
    DRAWTEXT r0, r2, r8, r3, r4

    ; Get pages (field 4)
    MOV r0, r1
    LDI r2, 4
    PROCINFO r0, r2
    MOV r14, r6
    LDI r20, BUF
    CALL int_to_str
    LDI r0, 180
    LDI r16, 4
    MOV r2, r26
    ADD r2, r16
    LDI r8, BUF
    LDI r3, C_FG
    LDI r4, 0
    DRAWTEXT r0, r2, r8, r3, r4

    ; Next PID
    LDI r7, 1
    ADD r1, r7
    JMP row_loop

rows_done:
    ; Footer bar
    LDI r0, 0
    LDI r2, 236
    LDI r8, 256
    LDI r3, 20
    LDI r4, C_TITLE
    RECTF r0, r2, r8, r3, r4

    ; Footer help
    LDI r20, BUF
    STRO r20, "W/S:Scroll K:Kill Q:Quit"
    LDI r0, 16
    LDI r2, 242
    LDI r8, BUF
    LDI r3, C_GRAY
    LDI r4, C_TITLE
    DRAWTEXT r0, r2, r8, r3, r4

    ; Process count
    MOV r14, r12
    LDI r20, BUF
    STRO r20, "Total:"
    LDI r0, 200
    LDI r2, 242
    LDI r8, BUF
    LDI r3, C_GRAY
    LDI r4, C_TITLE
    DRAWTEXT r0, r2, r8, r3, r4

    MOV r14, r12
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r0, 235
    LDI r2, 242
    LDI r8, NUMBUF
    LDI r3, C_CYAN
    LDI r4, C_TITLE
    DRAWTEXT r0, r2, r8, r3, r4

    ; Handle input
    IKEY r7
    JZ r7, no_input

    ; W = 87 (scroll up / prev)
    LDI r16, 87
    CMP r7, r16
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
    CMP r7, r16
    JNZ r6, chk_kill
    LDI r20, SEL_PID
    LOAD r16, r20
    LDI r17, 1
    ADD r16, r17
    CMP r16, r12
    BGE r6, no_input
    STORE r20, r16
    JMP no_input

chk_kill:
    ; K = 75 (kill)
    LDI r16, 75
    CMP r7, r16
    JNZ r6, chk_quit
    LDI r20, SEL_PID
    LOAD r16, r20
    JZ r16, no_input
    MOV r0, r16
    KILL r0
    JMP no_input

chk_quit:
    ; Q = 81 (quit)
    LDI r16, 81
    CMP r7, r16
    JNZ r6, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r14 (u32) to decimal string at r20
; Returns null-terminated. r6 = buffer start.
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
