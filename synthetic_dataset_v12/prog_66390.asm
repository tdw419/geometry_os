; DESCRIPTION: Draws a blue line from (359, 189) to (136, 137).
; PLAN: r0=359(x1), r1=189(y1), r2=136(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 189
LDI r2, 136
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
