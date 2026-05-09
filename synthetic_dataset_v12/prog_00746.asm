; DESCRIPTION: Draws a yellow line from (283, 181) to (51, 232).
; PLAN: r0=283(x1), r1=181(y1), r2=51(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 181
LDI r2, 51
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
