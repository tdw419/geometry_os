; DESCRIPTION: Places a black line segment connecting (343, 85) to (246, 83).
; PLAN: r0=343(x1), r1=85(y1), r2=246(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 85
LDI r2, 246
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
