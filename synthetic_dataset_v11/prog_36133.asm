; DESCRIPTION: Places a red line segment connecting (40, 101) to (35, 45).
; PLAN: r0=40(x1), r1=101(y1), r2=35(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 101
LDI r2, 35
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
