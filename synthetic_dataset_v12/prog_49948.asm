; DESCRIPTION: Places a white line segment connecting (376, 199) to (274, 60).
; PLAN: r0=376(x1), r1=199(y1), r2=274(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 199
LDI r2, 274
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
