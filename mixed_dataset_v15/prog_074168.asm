; DESCRIPTION: Places a cyan line segment connecting (142, 225) to (194, 176).
; PLAN: r0=142(x1), r1=225(y1), r2=194(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 225
LDI r2, 194
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
