; DESCRIPTION: Places a blue line segment connecting (75, 64) to (26, 205).
; PLAN: r0=75(x1), r1=64(y1), r2=26(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 64
LDI r2, 26
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
