; DESCRIPTION: Places a green line segment connecting (437, 110) to (494, 139).
; PLAN: r0=437(x1), r1=110(y1), r2=494(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 110
LDI r2, 494
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
