; DESCRIPTION: Renders a magenta line segment connecting (258, 144) to (93, 104).
; PLAN: r0=258(x1), r1=144(y1), r2=93(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 144
LDI r2, 93
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
