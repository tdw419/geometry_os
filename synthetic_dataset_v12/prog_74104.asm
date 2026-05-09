; DESCRIPTION: Places a purple line segment connecting (149, 161) to (461, 60).
; PLAN: r0=149(x1), r1=161(y1), r2=461(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 161
LDI r2, 461
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
