; DESCRIPTION: Places a blue line segment connecting (60, 95) to (6, 85).
; PLAN: r0=60(x1), r1=95(y1), r2=6(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 95
LDI r2, 6
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
