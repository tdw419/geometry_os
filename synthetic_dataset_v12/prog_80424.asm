; DESCRIPTION: Places a cyan line segment connecting (375, 36) to (22, 211).
; PLAN: r0=375(x1), r1=36(y1), r2=22(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 36
LDI r2, 22
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
