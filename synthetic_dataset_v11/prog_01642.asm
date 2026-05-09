; DESCRIPTION: Draws a blue line from (60, 230) to (136, 13).
; PLAN: r0=60(x1), r1=230(y1), r2=136(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 230
LDI r2, 136
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
