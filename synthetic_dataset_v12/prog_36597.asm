; DESCRIPTION: Draws a orange line from (227, 105) to (494, 71).
; PLAN: r0=227(x1), r1=105(y1), r2=494(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 105
LDI r2, 494
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
