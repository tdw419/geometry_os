; DESCRIPTION: Draws a yellow line from (133, 34) to (107, 141).
; PLAN: r0=133(x1), r1=34(y1), r2=107(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 34
LDI r2, 107
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
