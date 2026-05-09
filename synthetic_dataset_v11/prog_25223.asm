; DESCRIPTION: Places a cyan line segment connecting (104, 49) to (47, 45).
; PLAN: r0=104(x1), r1=49(y1), r2=47(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 49
LDI r2, 47
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
