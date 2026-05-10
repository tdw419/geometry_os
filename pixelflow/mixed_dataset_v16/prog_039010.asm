; DESCRIPTION: Draws a yellow line from (163, 139) to (391, 52).
; PLAN: r0=163(x1), r1=139(y1), r2=391(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 139
LDI r2, 391
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
