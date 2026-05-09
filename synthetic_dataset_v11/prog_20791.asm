; DESCRIPTION: Draws a blue line from (249, 5) to (136, 163).
; PLAN: r0=249(x1), r1=5(y1), r2=136(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 5
LDI r2, 136
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
