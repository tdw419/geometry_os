; DESCRIPTION: Places a cyan line segment connecting (50, 183) to (222, 104).
; PLAN: r0=50(x1), r1=183(y1), r2=222(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 183
LDI r2, 222
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
