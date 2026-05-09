; DESCRIPTION: Places a orange line segment connecting (215, 144) to (47, 139).
; PLAN: r0=215(x1), r1=144(y1), r2=47(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 144
LDI r2, 47
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
