; DESCRIPTION: Places a blue line segment connecting (450, 50) to (461, 49).
; PLAN: r0=450(x1), r1=50(y1), r2=461(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 50
LDI r2, 461
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
