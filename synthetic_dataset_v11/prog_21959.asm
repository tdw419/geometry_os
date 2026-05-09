; DESCRIPTION: Draws a orange line from (6, 98) to (170, 24).
; PLAN: r0=6(x1), r1=98(y1), r2=170(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 98
LDI r2, 170
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
