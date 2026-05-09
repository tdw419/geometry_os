; DESCRIPTION: Draws a magenta line from (409, 212) to (256, 147).
; PLAN: r0=409(x1), r1=212(y1), r2=256(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 212
LDI r2, 256
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
