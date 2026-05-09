; DESCRIPTION: Draws a yellow line from (370, 89) to (139, 245).
; PLAN: r0=370(x1), r1=89(y1), r2=139(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 89
LDI r2, 139
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
