; DESCRIPTION: Places a red line segment connecting (87, 139) to (10, 123).
; PLAN: r0=87(x1), r1=139(y1), r2=10(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 139
LDI r2, 10
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
