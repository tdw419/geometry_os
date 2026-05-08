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
LDI r0, 1

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
    IKEY r14
    JZ r14, no_input

    ; Left arrow (D=68) = previous month
    LDI r6, 68
    CMP r14, r6
    JZ r12, prev_month

    ; Right arrow (C=67) = next month
    LDI r6, 67
    CMP r14, r6
    JZ r12, next_month

    ; Up arrow (A=65) = previous year
    LDI r6, 65
    CMP r14, r6
    JZ r12, prev_year

    ; Down arrow (B=66) = next year
    LDI r6, 66
    CMP r14, r6
    JZ r12, next_year

    ; ESC = quit
    LDI r6, 27
    CMP r14, r6
    JZ r12, cal_quit

    JMP no_input

prev_month:
    LDI r20, MONTH
    LOAD r15, r20
    LDI r6, 1
    SUB r15, r6
    JNZ r15, pm_store
    LDI r15, 12
    LDI r20, YEAR
    LOAD r16, r20
    LDI r6, 1
    SUB r16, r6
    STORE r20, r16
    LDI r20, MONTH
pm_store:
    STORE r20, r15
    CALL compute_month
    JMP no_input

next_month:
    LDI r20, MONTH
    LOAD r15, r20
    LDI r6, 1
    ADD r15, r6
    LDI r6, 13
    CMP r15, r6
    JZ r12, nm_wrap
    STORE r20, r15
    CALL compute_month
    JMP no_input

nm_wrap:
    LDI r15, 1
    STORE r20, r15
    LDI r20, YEAR
    LOAD r15, r20
    LDI r6, 1
    ADD r15, r6
    STORE r20, r15
    CALL compute_month
    JMP no_input

prev_year:
    LDI r20, YEAR
    LOAD r15, r20
    LDI r6, 1
    SUB r15, r6
    STORE r20, r15
    CALL compute_month
    JMP no_input

next_year:
    LDI r20, YEAR
    LOAD r15, r20
    LDI r6, 1
    ADD r15, r6
    STORE r20, r15
    CALL compute_month
    JMP no_input

no_input:
    ; Update blink
    LDI r20, TICKS
    LOAD r15, r20
    LDI r6, 30
    DIV r15, r6
    LDI r20, BLINK
    STORE r20, r15

    ; Render
    CALL render_calendar

    FRAME
    JMP main_loop

cal_quit:
    HALT

; =========================================
; compute_month -- calculate days in month and first day
; Uses: r14-r19
; =========================================
compute_month:
    PUSH r31

    LDI r20, MONTH
    LOAD r14, r20       ; r14 = month (1-12)
    LDI r20, YEAR
    LOAD r6, r20       ; r6 = year

    ; Compute days in month
    LDI r4, 2
    CMP r14, r4
    JZ r12, feb_days

    ; Non-Feb: 30 days for Apr,Jun,Sep,Nov; 31 for rest
    LDI r4, 31
    LDI r9, 4
    CMP r14, r9
    JZ r12, set_30
    LDI r9, 6
    CMP r14, r9
    JZ r12, set_30
    LDI r9, 9
    CMP r14, r9
    JZ r12, set_30
    LDI r9, 11
    CMP r14, r9
    JZ r12, set_30
    JMP store_mdays

set_30:
    LDI r4, 30
    JMP store_mdays

feb_days:
    LDI r4, 28
    MOV r9, r6
    LDI r1, 4
    MOD r9, r1
    JNZ r9, store_mdays
    MOV r9, r6
    LDI r1, 100
    MOD r9, r1
    JNZ r9, is_leap
    MOV r9, r6
    LDI r1, 400
    MOD r9, r1
    JNZ r9, store_mdays

is_leap:
    LDI r4, 29

store_mdays:
    LDI r20, MDAYS
    STORE r20, r4

    ; Zeller congruence for first day
    MOV r9, r14
    MOV r1, r6

    ; Jan->13, Feb->14, year--
    LDI r15, 3
    CMP r9, r15
    BGE r12, zeller_ok
    LDI r15, 12
    ADD r9, r15
    LDI r15, 1
    SUB r1, r15

zeller_ok:
    ; K = year % 100
    MOV r15, r1
    LDI r16, 100
    MOD r15, r16

    ; J = year / 100
    MOV r16, r1
    LDI r17, 100
    DIV r16, r17

    ; (13*(m+1))/5
    LDI r17, 1
    ADD r9, r17
    LDI r17, 13
    MUL r9, r17
    LDI r17, 5
    DIV r9, r17

    ; h = 1 + 13*(m+1)/5 + K + K/4 + J/4 + 5*J
    LDI r17, 1
    ADD r17, r9
    ADD r17, r15
    MOV r18, r15
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
; Uses: r0-r13
; =========================================
render_calendar:
    PUSH r31

    ; Background
    LDI r0, 0x0D1B2A
    FILL r0

    ; Title bar
    LDI r0, 0
    LDI r7, 0
    LDI r10, 256
    LDI r5, 28
    LDI r2, 0x1B3A5C
    RECTF r0, r7, r10, r5, r2

    ; Month name in title
    LDI r20, MONTH
    LOAD r14, r20
    LDI r20, BUF
    CALL get_month_name
    LDI r0, 8
    LDI r7, 8
    LDI r10, BUF
    LDI r5, 0xFFFFFF
    LDI r2, 0x1B3A5C
    DRAWTEXT r0, r7, r10, r5, r2

    ; Year in title
    LDI r20, YEAR
    LOAD r15, r20
    LDI r20, BUF
    CALL int_to_str
    LDI r0, 80
    LDI r7, 8
    LDI r10, BUF
    LDI r5, 0xFFFFFF
    LDI r2, 0x1B3A5C
    DRAWTEXT r0, r7, r10, r5, r2

    ; =========================================
    ; Day-of-week header row
    ; =========================================
    LDI r2, 0x1A1A3A
    LDI r0, 16
    LDI r7, 32
    LDI r10, 224
    LDI r5, 16
    RECTF r0, r7, r10, r5, r2

    ; S M T W T F S headers
    LDI r0, 22
    LDI r7, 34
    LDI r20, BUF
    STRO r20, "S"
    LDI r10, BUF
    LDI r5, 0x8888BB
    LDI r2, 0x1A1A3A
    DRAWTEXT r0, r7, r10, r5, r2

    LDI r0, 54
    LDI r20, BUF
    STRO r20, "M"
    DRAWTEXT r0, r7, r10, r5, r2

    LDI r0, 86
    LDI r20, BUF
    STRO r20, "T"
    DRAWTEXT r0, r7, r10, r5, r2

    LDI r0, 118
    LDI r20, BUF
    STRO r20, "W"
    DRAWTEXT r0, r7, r10, r5, r2

    LDI r0, 150
    LDI r20, BUF
    STRO r20, "T"
    DRAWTEXT r0, r7, r10, r5, r2

    LDI r0, 182
    LDI r20, BUF
    STRO r20, "F"
    DRAWTEXT r0, r7, r10, r5, r2

    LDI r0, 214
    LDI r20, BUF
    STRO r20, "S"
    DRAWTEXT r0, r7, r10, r5, r2

    ; =========================================
    ; Draw day grid
    ; =========================================
    LDI r20, FDAY
    LOAD r11, r20          ; r11 = first day (0=Sun..6=Sat)
    LDI r20, MDAYS
    LOAD r13, r20          ; r13 = days in month
    LDI r14, 1            ; r14 = current day (1..31)

    ; Grid layout: 7 columns, each 32px wide, starting at x=16
    ; Row starts at y=50, each row 24px
    LDI r6, 0            ; column counter (0-6)
    MOV r4, r11           ; start column = first day
    LDI r9, 50           ; y position

day_loop:
    ; Check if done
    MOV r1, r13
    LDI r15, 1
    ADD r1, r15
    CMP r14, r1
    BGE r12, days_done

    ; Compute x position: 16 + column * 32 + 4
    MOV r15, r4
    LDI r16, 32
    MUL r15, r16
    LDI r16, 20
    ADD r15, r16          ; r15 = x

    ; Draw day cell background
    LDI r0, 0x16162E
    MOV r7, r9
    LDI r10, 28
    LDI r5, 22
    RECTF r15, r7, r10, r5, r0

    ; Save x position before int_to_str trashes registers
    MOV r8, r4           ; save column
    MOV r3, r9           ; save y

    ; Convert day number to string
    LDI r20, BUF
    MOV r15, r14
    CALL int_to_str

    ; Recompute x for text (centered in cell)
    MOV r15, r8
    LDI r16, 32
    MUL r15, r16
    LDI r16, 26
    ADD r15, r16          ; x for text
    MOV r7, r3            ; restore y
    LDI r16, 4
    ADD r7, r16           ; y offset for text
    LDI r10, BUF
    LDI r5, 0xCCCCFF
    LDI r2, 0x16162E
    DRAWTEXT r15, r7, r10, r5, r2

    ; Advance column
    LDI r16, 1
    ADD r4, r16
    LDI r16, 7
    CMP r4, r16
    BLT r12, same_row

    ; New row
    LDI r4, 0
    LDI r16, 24
    ADD r9, r16

same_row:
    ; Next day
    LDI r16, 1
    ADD r14, r16
    JMP day_loop

days_done:
    ; =========================================
    ; Footer
    ; =========================================
    LDI r0, 0
    LDI r7, 236
    LDI r10, 256
    LDI r5, 20
    LDI r2, 0x0A0A1A
    RECTF r0, r7, r10, r5, r2

    LDI r20, BUF
    STRO r20, "Arrows: navigate  ESC: quit"
    LDI r0, 40
    LDI r7, 240
    LDI r10, BUF
    LDI r5, 0x6666AA
    LDI r2, 0x0A0A1A
    DRAWTEXT r0, r7, r10, r5, r2

    POP r31
    RET

; =========================================
; get_month_name -- write month name to BUF
; Input: r14 = month (1-12), r20 = buffer addr
; =========================================
get_month_name:
    PUSH r31

    LDI r6, 1
    CMP r14, r6
    JZ r12, gm_jan

    LDI r6, 2
    CMP r14, r6
    JZ r12, gm_feb

    LDI r6, 3
    CMP r14, r6
    JZ r12, gm_mar

    LDI r6, 4
    CMP r14, r6
    JZ r12, gm_apr

    LDI r6, 5
    CMP r14, r6
    JZ r12, gm_may

    LDI r6, 6
    CMP r14, r6
    JZ r12, gm_jun

    LDI r6, 7
    CMP r14, r6
    JZ r12, gm_jul

    LDI r6, 8
    CMP r14, r6
    JZ r12, gm_aug

    LDI r6, 9
    CMP r14, r6
    JZ r12, gm_sep

    LDI r6, 10
    CMP r14, r6
    JZ r12, gm_oct

    LDI r6, 11
    CMP r14, r6
    JZ r12, gm_nov

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
; Converts r15 (u32) to decimal string at r20
; Destroys r15-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0

    JZ r15, its_zero

its_loop:
    MOV r18, r15
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r15, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r15, its_loop

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
