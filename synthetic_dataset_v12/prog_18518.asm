; DESCRIPTION: Places a cyan line segment connecting (49, 36) to (110, 5).
; PLAN: r0=49(x1), r1=36(y1), r2=110(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 36
LDI r2, 110
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
