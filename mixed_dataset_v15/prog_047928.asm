; DESCRIPTION: Draws a yellow line from (137, 185) to (164, 101).
; PLAN: r0=137(x1), r1=185(y1), r2=164(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 185
LDI r2, 164
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
