; DESCRIPTION: Places a red line segment connecting (496, 50) to (54, 139).
; PLAN: r0=496(x1), r1=50(y1), r2=54(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 50
LDI r2, 54
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
