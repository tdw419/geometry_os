; DESCRIPTION: Draws a black line from (136, 105) to (204, 102).
; PLAN: r0=136(x1), r1=105(y1), r2=204(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 105
LDI r2, 204
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
