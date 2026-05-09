; DESCRIPTION: Renders a yellow line between points (6, 170) and (334, 137).
; PLAN: r0=6(x1), r1=170(y1), r2=334(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 170
LDI r2, 334
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
