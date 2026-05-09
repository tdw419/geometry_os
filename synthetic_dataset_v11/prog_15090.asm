; DESCRIPTION: Places a red line segment connecting (141, 14) to (68, 172).
; PLAN: r0=141(x1), r1=14(y1), r2=68(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 14
LDI r2, 68
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
