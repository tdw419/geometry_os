; DESCRIPTION: Draws a blue line from (147, 225) to (32, 216).
; PLAN: r0=147(x1), r1=225(y1), r2=32(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 225
LDI r2, 32
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
