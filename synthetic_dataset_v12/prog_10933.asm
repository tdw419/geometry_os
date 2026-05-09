; DESCRIPTION: Draws a orange line from (130, 118) to (17, 240).
; PLAN: r0=130(x1), r1=118(y1), r2=17(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 118
LDI r2, 17
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
