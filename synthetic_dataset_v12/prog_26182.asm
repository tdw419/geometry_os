; DESCRIPTION: Places a cyan line segment connecting (241, 136) to (378, 178).
; PLAN: r0=241(x1), r1=136(y1), r2=378(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 136
LDI r2, 378
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
