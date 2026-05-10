; DESCRIPTION: Draws a blue line from (273, 167) to (299, 147).
; PLAN: r0=273(x1), r1=167(y1), r2=299(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 167
LDI r2, 299
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
