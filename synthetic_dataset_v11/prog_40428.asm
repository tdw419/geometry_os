; DESCRIPTION: Places a blue line segment connecting (125, 75) to (4, 205).
; PLAN: r0=125(x1), r1=75(y1), r2=4(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 75
LDI r2, 4
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
