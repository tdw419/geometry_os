; DESCRIPTION: Places a white line segment connecting (246, 139) to (163, 99).
; PLAN: r0=246(x1), r1=139(y1), r2=163(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 139
LDI r2, 163
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
