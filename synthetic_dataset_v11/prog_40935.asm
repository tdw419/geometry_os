; DESCRIPTION: Draws a yellow line from (40, 98) to (47, 245).
; PLAN: r0=40(x1), r1=98(y1), r2=47(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 98
LDI r2, 47
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
