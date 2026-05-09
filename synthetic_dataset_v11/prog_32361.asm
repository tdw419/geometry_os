; DESCRIPTION: Draws a yellow line from (212, 133) to (253, 129).
; PLAN: r0=212(x1), r1=133(y1), r2=253(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 133
LDI r2, 253
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
