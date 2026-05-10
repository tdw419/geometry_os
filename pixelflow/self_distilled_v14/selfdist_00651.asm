; DESCRIPTION: Renders a green line segment connecting (348, 139) to (312, 168).
; PLAN: r0=348(x1), r1=139(y1), r2=312(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 139
LDI r2, 312
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
