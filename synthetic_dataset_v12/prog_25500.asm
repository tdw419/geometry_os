; DESCRIPTION: Places a white line segment connecting (68, 26) to (222, 245).
; PLAN: r0=68(x1), r1=26(y1), r2=222(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 26
LDI r2, 222
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
