; DESCRIPTION: Draws a yellow line from (86, 142) to (58, 205).
; PLAN: r0=86(x1), r1=142(y1), r2=58(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 142
LDI r2, 58
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
