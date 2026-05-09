; DESCRIPTION: Draws a green line from (181, 88) to (145, 129).
; PLAN: r0=181(x1), r1=88(y1), r2=145(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 88
LDI r2, 145
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
