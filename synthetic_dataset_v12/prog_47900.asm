; DESCRIPTION: Draws a blue line from (52, 176) to (76, 147).
; PLAN: r0=52(x1), r1=176(y1), r2=76(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 176
LDI r2, 76
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
