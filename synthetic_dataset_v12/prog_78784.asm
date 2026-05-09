; DESCRIPTION: Places a black line segment connecting (37, 66) to (139, 139).
; PLAN: r0=37(x1), r1=66(y1), r2=139(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 66
LDI r2, 139
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
