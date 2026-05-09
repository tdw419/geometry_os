; DESCRIPTION: Draws a yellow line from (155, 182) to (188, 164).
; PLAN: r0=155(x1), r1=182(y1), r2=188(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 182
LDI r2, 188
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
