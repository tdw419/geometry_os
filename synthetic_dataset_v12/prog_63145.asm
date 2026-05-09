; DESCRIPTION: Places a white line segment connecting (376, 11) to (105, 238).
; PLAN: r0=376(x1), r1=11(y1), r2=105(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 11
LDI r2, 105
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
