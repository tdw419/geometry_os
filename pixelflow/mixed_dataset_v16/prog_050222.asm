; DESCRIPTION: Renders a red line segment connecting (382, 24) to (88, 168).
; PLAN: r0=382(x1), r1=24(y1), r2=88(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 24
LDI r2, 88
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
