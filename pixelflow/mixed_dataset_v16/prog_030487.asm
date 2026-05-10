; DESCRIPTION: Draws a yellow line from (14, 211) to (364, 157).
; PLAN: r0=14(x1), r1=211(y1), r2=364(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 211
LDI r2, 364
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
