; DESCRIPTION: Places a cyan line segment connecting (225, 227) to (478, 74).
; PLAN: r0=225(x1), r1=227(y1), r2=478(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 227
LDI r2, 478
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
