; DESCRIPTION: Renders a red line segment connecting (13, 50) to (273, 116).
; PLAN: r0=13(x1), r1=50(y1), r2=273(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 50
LDI r2, 273
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
