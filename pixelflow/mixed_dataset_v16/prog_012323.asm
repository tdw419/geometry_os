; DESCRIPTION: Renders a yellow line segment connecting (156, 83) to (200, 114).
; PLAN: r0=156(x1), r1=83(y1), r2=200(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 83
LDI r2, 200
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
