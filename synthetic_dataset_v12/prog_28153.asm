; DESCRIPTION: Places a cyan line segment connecting (190, 251) to (508, 232).
; PLAN: r0=190(x1), r1=251(y1), r2=508(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 251
LDI r2, 508
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
