; DESCRIPTION: Places a cyan line segment connecting (335, 158) to (417, 225).
; PLAN: r0=335(x1), r1=158(y1), r2=417(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 158
LDI r2, 417
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
