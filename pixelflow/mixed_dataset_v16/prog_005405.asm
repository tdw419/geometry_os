; DESCRIPTION: Renders a magenta line segment connecting (336, 92) to (227, 12).
; PLAN: r0=336(x1), r1=92(y1), r2=227(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 92
LDI r2, 227
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
