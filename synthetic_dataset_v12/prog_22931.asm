; DESCRIPTION: Draws a yellow line from (376, 34) to (192, 15).
; PLAN: r0=376(x1), r1=34(y1), r2=192(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 34
LDI r2, 192
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
