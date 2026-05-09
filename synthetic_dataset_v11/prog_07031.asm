; DESCRIPTION: Places a black line segment connecting (124, 139) to (166, 101).
; PLAN: r0=124(x1), r1=139(y1), r2=166(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 139
LDI r2, 166
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
