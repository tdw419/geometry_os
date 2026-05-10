; DESCRIPTION: Places a blue line segment connecting (471, 6) to (39, 205).
; PLAN: r0=471(x1), r1=6(y1), r2=39(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 6
LDI r2, 39
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
