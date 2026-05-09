; DESCRIPTION: Draws a black line from (155, 88) to (204, 77).
; PLAN: r0=155(x1), r1=88(y1), r2=204(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 88
LDI r2, 204
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
