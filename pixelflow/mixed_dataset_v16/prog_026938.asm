; DESCRIPTION: Places a cyan line segment connecting (200, 245) to (378, 130).
; PLAN: r0=200(x1), r1=245(y1), r2=378(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 245
LDI r2, 378
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
