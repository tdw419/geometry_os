; DESCRIPTION: Renders a yellow line segment connecting (221, 52) to (94, 11).
; PLAN: r0=221(x1), r1=52(y1), r2=94(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 52
LDI r2, 94
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
