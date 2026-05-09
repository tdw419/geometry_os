; DESCRIPTION: Draws a blue line from (15, 196) to (147, 20).
; PLAN: r0=15(x1), r1=196(y1), r2=147(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 196
LDI r2, 147
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
