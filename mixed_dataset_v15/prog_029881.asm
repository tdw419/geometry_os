; DESCRIPTION: Places a white line segment connecting (211, 26) to (376, 85).
; PLAN: r0=211(x1), r1=26(y1), r2=376(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 26
LDI r2, 376
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
