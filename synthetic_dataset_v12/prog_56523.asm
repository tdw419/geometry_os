; DESCRIPTION: Places a white line segment connecting (109, 254) to (175, 139).
; PLAN: r0=109(x1), r1=254(y1), r2=175(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 254
LDI r2, 175
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
