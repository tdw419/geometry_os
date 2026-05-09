; DESCRIPTION: Places a cyan line segment connecting (375, 105) to (252, 211).
; PLAN: r0=375(x1), r1=105(y1), r2=252(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 105
LDI r2, 252
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
