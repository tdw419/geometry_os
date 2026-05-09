; DESCRIPTION: Draws a blue line from (442, 63) to (147, 75).
; PLAN: r0=442(x1), r1=63(y1), r2=147(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 63
LDI r2, 147
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
