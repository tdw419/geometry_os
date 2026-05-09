; DESCRIPTION: Places a blue line segment connecting (266, 134) to (276, 85).
; PLAN: r0=266(x1), r1=134(y1), r2=276(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 134
LDI r2, 276
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
