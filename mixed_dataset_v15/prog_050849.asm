; DESCRIPTION: Places a red line segment connecting (376, 142) to (2, 36).
; PLAN: r0=376(x1), r1=142(y1), r2=2(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 142
LDI r2, 2
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
