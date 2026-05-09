; DESCRIPTION: Places a white line segment connecting (396, 138) to (131, 245).
; PLAN: r0=396(x1), r1=138(y1), r2=131(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 138
LDI r2, 131
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
