; DESCRIPTION: Renders a blue line between points (23, 156) and (341, 12).
; PLAN: r0=23(x1), r1=156(y1), r2=341(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 156
LDI r2, 341
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
