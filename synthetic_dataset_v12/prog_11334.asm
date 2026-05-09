; DESCRIPTION: Places a black line segment connecting (139, 120) to (459, 194).
; PLAN: r0=139(x1), r1=120(y1), r2=459(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 120
LDI r2, 459
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
