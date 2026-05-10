; DESCRIPTION: Places a black line segment connecting (11, 139) to (266, 204).
; PLAN: r0=11(x1), r1=139(y1), r2=266(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 139
LDI r2, 266
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
