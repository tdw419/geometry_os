; DESCRIPTION: Draws a yellow line from (133, 141) to (457, 175).
; PLAN: r0=133(x1), r1=141(y1), r2=457(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 141
LDI r2, 457
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
