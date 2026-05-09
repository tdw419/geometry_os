; DESCRIPTION: Places a green line segment connecting (378, 252) to (154, 109).
; PLAN: r0=378(x1), r1=252(y1), r2=154(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 252
LDI r2, 154
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
