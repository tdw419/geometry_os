; DESCRIPTION: Draws a yellow line from (129, 251) to (62, 99).
; PLAN: r0=129(x1), r1=251(y1), r2=62(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 251
LDI r2, 62
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
