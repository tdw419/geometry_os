; DESCRIPTION: Places a white line segment connecting (193, 78) to (139, 254).
; PLAN: r0=193(x1), r1=78(y1), r2=139(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 78
LDI r2, 139
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
