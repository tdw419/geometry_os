; DESCRIPTION: Places a blue line segment connecting (252, 75) to (4, 32).
; PLAN: r0=252(x1), r1=75(y1), r2=4(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 75
LDI r2, 4
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
