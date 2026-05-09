; DESCRIPTION: Places a cyan line segment connecting (248, 216) to (189, 11).
; PLAN: r0=248(x1), r1=216(y1), r2=189(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 216
LDI r2, 189
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
