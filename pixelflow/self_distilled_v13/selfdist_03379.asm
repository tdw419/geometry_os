; DESCRIPTION: Renders a red line segment connecting (86, 44) to (119, 163).
; PLAN: r0=86(x1), r1=44(y1), r2=119(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 44
LDI r2, 119
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
