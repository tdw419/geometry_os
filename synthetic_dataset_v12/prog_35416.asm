; DESCRIPTION: Draws a orange line from (52, 14) to (0, 86).
; PLAN: r0=52(x1), r1=14(y1), r2=0(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 14
LDI r2, 0
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
