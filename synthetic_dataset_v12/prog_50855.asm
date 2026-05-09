; DESCRIPTION: Places a black line segment connecting (497, 231) to (85, 205).
; PLAN: r0=497(x1), r1=231(y1), r2=85(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 231
LDI r2, 85
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
