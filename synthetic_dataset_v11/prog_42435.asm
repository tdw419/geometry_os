; DESCRIPTION: Places a black line segment connecting (83, 139) to (6, 189).
; PLAN: r0=83(x1), r1=139(y1), r2=6(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 139
LDI r2, 6
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
