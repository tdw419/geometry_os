; DESCRIPTION: Renders a red line segment connecting (364, 124) to (158, 45).
; PLAN: r0=364(x1), r1=124(y1), r2=158(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 124
LDI r2, 158
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
