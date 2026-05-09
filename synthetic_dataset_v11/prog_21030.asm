; DESCRIPTION: Draws a magenta line from (147, 240) to (13, 237).
; PLAN: r0=147(x1), r1=240(y1), r2=13(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 240
LDI r2, 13
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
