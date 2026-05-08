; DESCRIPTION: This GeOS assembly code implements a monthly calendar display that navigates through months and years using arrow keys. It uses Zeller's congruence to calculate the day of the week and renders the calendar grid with day numbers on the screen. The program handles month transitions, leap year calculations, and user input for navigation and quitting.

; calendar.asm -- Monthly Calendar for Geometry OS
;
; Shows a month grid with day numbers. Arrow keys navigate months.
; Uses Zeller congruence for day-of-week calculation.
;
; Proves: DIV, MOD, MUL, SUB, ADD, CMP, BLT, BGE, TEXT, DRAWTEXT,
;         RECTF, STRO, IKEY, FRAME, integer math algorithms.
;
; RAM Layout:
;   0x6000-0x60FF  Text buffers
;   0x6100         Month (1-12)
;   0x6101         Year
;   0x6102         Days in month
;   0x6103         First day of month (0=Sun, 6=Sat)
;   0x6104         Frame counter for blink
;
; Zeller Congruence (adapted for 0=Sunday):
;   h = (q + (13*(m+1))/5 + K + K/4 + J/4 + 5*J) % 7
;   where q=day, m=month (3=Mar..14=Feb), K=year%100, J=year/100
;   Result: 0=Saturday, 1=Sunday, ... 6=Friday
;   Shift by +1 for Sunday=0: (h+1)%7
;
; No colons in comments (assembler pitfall)

#define TICKS   0xFFE
#define BUF     0x6000
#define MONTH   0x6100
#define YEAR    0x6101
#define MDAYS   0x6102
#define FDAY    0x6103
#define BLINK   0x6104

; Init
LDI r30, 0xFD00
LDI r4, 1

; Default month/year (April 2026)
LDI r20, MONTH
LDI r21, 4
STORE r20, r21
LDI r20, YEAR
LDI r21, 2026
STORE r20, r21
LDI r20, BLINK
LDI r21, 0
STORE r20, r21

; Compute initial month data
CALL compute_month

; =========================================
; Main Loop
; =========================================
main_loop:
    ; Read keyboard
    IKEY r3
    JZ r3, no_input

    ; Left arrow (D=68) = previous month
    LDI r0, 68
    CMP r3, r0
    JZ r15, prev_month

    ; Right arrow (C=67) = next month
    LDI r0, 67
    CMP r3, r0
    JZ r15, next_month

    ; Up arrow (A=65) = previous year
    LDI r0, 65
    CMP r3, r0
    JZ r15, prev_year

    ; Down arrow (B=66) = next year
    LDI r0, 66
    CMP r3, r0
    JZ r15, next_year

    ; ESC = quit
    LDI r0, 27
    CMP r3, r0
    JZ r15, cal_quit

    JMP no_input

prev_month:
    LDI r20, MONTH
    LOAD r13, r20
    LDI r0, 1
    SUB r13, r0
    JNZ r13, pm_store
    LDI r13, 12
    LDI r20, YEAR
    LOAD r16, r20
    LDI r0, 1
    SUB r16, r0
    STORE r20, r16
    LDI r20, MONTH
pm_store:
    STORE r20, r13
    CALL compute_month
    JMP no_input

next_month:
    LDI r20, MONTH
    LOAD r13, r20
    LDI r0, 1
    ADD r13, r0
    LDI r0, 13
    CMP r13, r0
    JZ r15, nm_wrap
    STORE r20, r13
    CALL compute_month
    JMP no_input

nm_wrap:
    LDI r13, 1
    STORE r20, r13
    LDI r20, YEAR
    LOAD r13, r20
    LDI r0, 1
    ADD r13, r0
    STORE r20, r13
    CALL compute_month
    JMP no_input

prev_year:
    LDI r20, YEAR
    LOAD r13, r20
    LDI r0, 1
    SUB r13, r0
    STORE r20, r13
    CALL compute_month
    JMP no_input

next_year:
    LDI r20, YEAR
    LOAD r13, r20
    LDI r0, 1
    ADD r13, r0
    STORE r20, r13
    CALL compute_month
    JMP no_input

no_input:
    ; Update blink
    LDI r20, TICKS
    LOAD r13, r20
    LDI r0, 30
    DIV r13, r0
    LDI r20, BLINK
    STORE r20, r13

    ; Render
    CALL render_calendar

    FRAME
    JMP main_loop

cal_quit:
    HALT

; =========================================
; compute_month -- calculate days in month and first day
; Uses: r3-r19
; =========================================
compute_month:
    PUSH r31

    LDI r20, MONTH
    LOAD r3, r20       ; r3 = month (1-12)
    LDI r20, YEAR
    LOAD r0, r20       ; r0 = year

    ; Compute days in month
    LDI r2, 2
    CMP r3, r2
    JZ r15, feb_days

    ; Non-Feb: 30 days for Apr,Jun,Sep,Nov; 31 for rest
    LDI r2, 31
    LDI r12, 4
    CMP r3, r12
    JZ r15, set_30
    LDI r12, 6
    CMP r3, r12
    JZ r15, set_30
    LDI r12, 9
    CMP r3, r12
    JZ r15, set_30
    LDI r12, 11
    CMP r3, r12
    JZ r15, set_30
    JMP store_mdays

set_30:
    LDI r2, 30
    JMP store_mdays

feb_days:
    LDI r2, 28
    MOV r12, r0
    LDI r9, 4
    MOD r12, r9
    JNZ r12, store_mdays
    MOV r12, r0
    LDI r9, 100
    MOD r12, r9
    JNZ r12, is_leap
    MOV r12, r0
    LDI r9, 400
    MOD r12, r9
    JNZ r12, store_mdays

is_leap:
    LDI r2, 29

store_mdays:
    LDI r20, MDAYS
    STORE r20, r2

    ; Zeller congruence for first day
    MOV r12, r3
    MOV r9, r0

    ; Jan->13, Feb->14, year--
    LDI r13, 3
    CMP r12, r13
    BGE r15, zeller_ok
    LDI r13, 12
    ADD r12, r13
    LDI r13, 1
    SUB r9, r13

zeller_ok:
    ; K = year % 100
    MOV r13, r9
    LDI r16, 100
    MOD r13, r16

    ; J = year / 100
    MOV r16, r9
    LDI r17, 100
    DIV r16, r17

    ; (13*(m+1))/5
    LDI r17, 1
    ADD r12, r17
    LDI r17, 13
    MUL r12, r17
    LDI r17, 5
    DIV r12, r17

    ; h = 1 + 13*(m+1)/5 + K + K/4 + J/4 + 5*J
    LDI r17, 1
    ADD r17, r12
    ADD r17, r13
    MOV r18, r13
    LDI r19, 4
    DIV r18, r19
    ADD r17, r18
    MOV r18, r16
    LDI r19, 4
    DIV r18, r19
    ADD r17, r18
    LDI r18, 5
    MUL r18, r16
    ADD r17, r18

    ; h = h % 7
    LDI r18, 7
    MOD r17, r18

    ; Convert to 0=Sunday: (h + 6) % 7
    ; Zeller: 0=Sat,1=Sun,2=Mon,3=Tue,4=Wed,5=Thu,6=Fri
    ; Target: 0=Sun,1=Mon,2=Tue,3=Wed,4=Thu,5=Fri,6=Sat
    LDI r18, 6
    ADD r17, r18
    LDI r18, 7
    MOD r17, r18

    LDI r20, FDAY
    STORE r20, r17

    POP r31
    RET

; =========================================
; render_calendar -- draw the calendar screen
; Uses: r4-r10
; =========================================
render_calendar:
    PUSH r31

    ; Background
    LDI r4, 0x0D1B2A
    FILL r4

    ; Title bar
    LDI r4, 0
    LDI r14, 0
    LDI r11, 256
    LDI r6, 28
    LDI r1, 0x1B3A5C
    RECTF r4, r14, r11, r6, r1

    ; Month name in title
    LDI r20, MONTH
    LOAD r3, r20
    LDI r20, BUF
    CALL get_month_name
    LDI r4, 8
    LDI r14, 8
    LDI r11, BUF
    LDI r6, 0xFFFFFF
    LDI r1, 0x1B3A5C
    DRAWTEXT r4, r14, r11, r6, r1

    ; Year in title
    LDI r20, YEAR
    LOAD r13, r20
    LDI r20, BUF
    CALL int_to_str
    LDI r4, 80
    LDI r14, 8
    LDI r11, BUF
    LDI r6, 0xFFFFFF
    LDI r1, 0x1B3A5C
    DRAWTEXT r4, r14, r11, r6, r1

    ; =========================================
    ; Day-of-week header row
    ; =========================================
    LDI r1, 0x1A1A3A
    LDI r4, 16
    LDI r14, 32
    LDI r11, 224
    LDI r6, 16
    RECTF r4, r14, r11, r6, r1

    ; S M T W T F S headers
    LDI r4, 22
    LDI r14, 34
    LDI r20, BUF
    STRO r20, "S"
    LDI r11, BUF
    LDI r6, 0x8888BB
    LDI r1, 0x1A1A3A
    DRAWTEXT r4, r14, r11, r6, r1

    LDI r4, 54
    LDI r20, BUF
    STRO r20, "M"
    DRAWTEXT r4, r14, r11, r6, r1

    LDI r4, 86
    LDI r20, BUF
    STRO r20, "T"
    DRAWTEXT r4, r14, r11, r6, r1

    LDI r4, 118
    LDI r20, BUF
    STRO r20, "W"
    DRAWTEXT r4, r14, r11, r6, r1

    LDI r4, 150
    LDI r20, BUF
    STRO r20, "T"
    DRAWTEXT r4, r14, r11, r6, r1

    LDI r4, 182
    LDI r20, BUF
    STRO r20, "F"
    DRAWTEXT r4, r14, r11, r6, r1

    LDI r4, 214
    LDI r20, BUF
    STRO r20, "S"
    DRAWTEXT r4, r14, r11, r6, r1

    ; =========================================
    ; Draw day grid
    ; =========================================
    LDI r20, FDAY
    LOAD r5, r20          ; r5 = first day (0=Sun..6=Sat)
    LDI r20, MDAYS
    LOAD r10, r20          ; r10 = days in month
    LDI r3, 1            ; r3 = current day (1..31)

    ; Grid layout: 7 columns, each 32px wide, starting at x=16
    ; Row starts at y=50, each row 24px
    LDI r0, 0            ; column counter (0-6)
    MOV r2, r5           ; start column = first day
    LDI r12, 50           ; y position

day_loop:
    ; Check if done
    MOV r9, r10
    LDI r13, 1
    ADD r9, r13
    CMP r3, r9
    BGE r15, days_done

    ; Compute x position: 16 + column * 32 + 4
    MOV r13, r2
    LDI r16, 32
    MUL r13, r16
    LDI r16, 20
    ADD r13, r16          ; r13 = x

    ; Draw day cell background
    LDI r4, 0x16162E
    MOV r14, r12
    LDI r11, 28
    LDI r6, 22
    RECTF r13, r14, r11, r6, r4

    ; Save x position before int_to_str trashes registers
    MOV r8, r2           ; save column
    MOV r7, r12           ; save y

    ; Convert day number to string
    LDI r20, BUF
    MOV r13, r3
    CALL int_to_str

    ; Recompute x for text (centered in cell)
    MOV r13, r8
    LDI r16, 32
    MUL r13, r16
    LDI r16, 26
    ADD r13, r16          ; x for text
    MOV r14, r7            ; restore y
    LDI r16, 4
    ADD r14, r16           ; y offset for text
    LDI r11, BUF
    LDI r6, 0xCCCCFF
    LDI r1, 0x16162E
    DRAWTEXT r13, r14, r11, r6, r1

    ; Advance column
    LDI r16, 1
    ADD r2, r16
    LDI r16, 7
    CMP r2, r16
    BLT r15, same_row

    ; New row
    LDI r2, 0
    LDI r16, 24
    ADD r12, r16

same_row:
    ; Next day
    LDI r16, 1
    ADD r3, r16
    JMP day_loop

days_done:
    ; =========================================
    ; Footer
    ; =========================================
    LDI r4, 0
    LDI r14, 236
    LDI r11, 256
    LDI r6, 20
    LDI r1, 0x0A0A1A
    RECTF r4, r14, r11, r6, r1

    LDI r20, BUF
    STRO r20, "Arrows: navigate  ESC: quit"
    LDI r4, 40
    LDI r14, 240
    LDI r11, BUF
    LDI r6, 0x6666AA
    LDI r1, 0x0A0A1A
    DRAWTEXT r4, r14, r11, r6, r1

    POP r31
    RET

; =========================================
; get_month_name -- write month name to BUF
; Input: r3 = month (1-12), r20 = buffer addr
; =========================================
get_month_name:
    PUSH r31

    LDI r0, 1
    CMP r3, r0
    JZ r15, gm_jan

    LDI r0, 2
    CMP r3, r0
    JZ r15, gm_feb

    LDI r0, 3
    CMP r3, r0
    JZ r15, gm_mar

    LDI r0, 4
    CMP r3, r0
    JZ r15, gm_apr

    LDI r0, 5
    CMP r3, r0
    JZ r15, gm_may

    LDI r0, 6
    CMP r3, r0
    JZ r15, gm_jun

    LDI r0, 7
    CMP r3, r0
    JZ r15, gm_jul

    LDI r0, 8
    CMP r3, r0
    JZ r15, gm_aug

    LDI r0, 9
    CMP r3, r0
    JZ r15, gm_sep

    LDI r0, 10
    CMP r3, r0
    JZ r15, gm_oct

    LDI r0, 11
    CMP r3, r0
    JZ r15, gm_nov

    ; Default: December
    STRO r20, "December"
    POP r31
    RET

gm_jan:
    STRO r20, "January"
    POP r31
    RET

gm_feb:
    STRO r20, "February"
    POP r31
    RET

gm_mar:
    STRO r20, "March"
    POP r31
    RET

gm_apr:
    STRO r20, "April"
    POP r31
    RET

gm_may:
    STRO r20, "May"
    POP r31
    RET

gm_jun:
    STRO r20, "June"
    POP r31
    RET

gm_jul:
    STRO r20, "July"
    POP r31
    RET

gm_aug:
    STRO r20, "August"
    POP r31
    RET

gm_sep:
    STRO r20, "September"
    POP r31
    RET

gm_oct:
    STRO r20, "October"
    POP r31
    RET

gm_nov:
    STRO r20, "November"
    POP r31
    RET

; =========================================
; int_to_str subroutine
; Converts r13 (u32) to decimal string at r20
; Destroys r13-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0

    JZ r13, its_zero

its_loop:
    MOV r18, r13
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r13, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r13, its_loop

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
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r31
    RET
