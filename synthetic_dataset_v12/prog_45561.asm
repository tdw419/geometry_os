; DESCRIPTION: Draws a yellow line from (149, 192) to (179, 233).
; PLAN: r0=149(x1), r1=192(y1), r2=179(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 192
LDI r2, 179
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
