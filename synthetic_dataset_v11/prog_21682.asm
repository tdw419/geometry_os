; DESCRIPTION: Draws a orange line from (232, 12) to (52, 48).
; PLAN: r0=232(x1), r1=12(y1), r2=52(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 12
LDI r2, 52
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
