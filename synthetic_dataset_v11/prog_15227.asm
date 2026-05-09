; DESCRIPTION: Places a red line segment connecting (122, 48) to (139, 23).
; PLAN: r0=122(x1), r1=48(y1), r2=139(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 48
LDI r2, 139
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
