; DESCRIPTION: Places a red line segment connecting (233, 156) to (376, 239).
; PLAN: r0=233(x1), r1=156(y1), r2=376(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 156
LDI r2, 376
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
