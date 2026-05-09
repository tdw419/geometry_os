; DESCRIPTION: Draws a blue line from (1, 29) to (263, 147).
; PLAN: r0=1(x1), r1=29(y1), r2=263(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 29
LDI r2, 263
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
