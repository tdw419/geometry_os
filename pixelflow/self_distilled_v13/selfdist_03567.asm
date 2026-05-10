; DESCRIPTION: Renders a green line segment connecting (399, 92) to (109, 52).
; PLAN: r0=399(x1), r1=92(y1), r2=109(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 92
LDI r2, 109
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
