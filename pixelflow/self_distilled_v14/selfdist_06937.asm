; DESCRIPTION: Renders a red line segment connecting (58, 134) to (56, 139).
; PLAN: r0=58(x1), r1=134(y1), r2=56(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 134
LDI r2, 56
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
