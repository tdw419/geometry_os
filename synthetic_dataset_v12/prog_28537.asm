; DESCRIPTION: Places a white line segment connecting (497, 82) to (490, 9).
; PLAN: r0=497(x1), r1=82(y1), r2=490(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 82
LDI r2, 490
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
