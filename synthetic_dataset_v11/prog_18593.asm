; DESCRIPTION: Places a blue line segment connecting (106, 159) to (145, 62).
; PLAN: r0=106(x1), r1=159(y1), r2=145(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 159
LDI r2, 145
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
