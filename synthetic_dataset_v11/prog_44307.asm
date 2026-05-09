; DESCRIPTION: Places a blue line segment connecting (183, 101) to (70, 106).
; PLAN: r0=183(x1), r1=101(y1), r2=70(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 101
LDI r2, 70
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
