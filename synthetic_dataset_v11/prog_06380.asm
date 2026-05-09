; DESCRIPTION: Draws a purple line from (145, 234) to (20, 136).
; PLAN: r0=145(x1), r1=234(y1), r2=20(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 234
LDI r2, 20
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
