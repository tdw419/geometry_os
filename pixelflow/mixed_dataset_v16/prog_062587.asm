; DESCRIPTION: Places a green line segment connecting (477, 34) to (204, 139).
; PLAN: r0=477(x1), r1=34(y1), r2=204(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 34
LDI r2, 204
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
