; DESCRIPTION: Places a orange line segment connecting (19, 48) to (341, 82).
; PLAN: r0=19(x1), r1=48(y1), r2=341(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 48
LDI r2, 341
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
