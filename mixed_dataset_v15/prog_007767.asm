; DESCRIPTION: Places a orange line segment connecting (351, 30) to (487, 53).
; PLAN: r0=351(x1), r1=30(y1), r2=487(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 30
LDI r2, 487
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
