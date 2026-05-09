; DESCRIPTION: Places a cyan line segment connecting (511, 216) to (451, 245).
; PLAN: r0=511(x1), r1=216(y1), r2=451(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 216
LDI r2, 451
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
