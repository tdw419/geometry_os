; DESCRIPTION: Places a blue line segment connecting (285, 145) to (343, 82).
; PLAN: r0=285(x1), r1=145(y1), r2=343(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 145
LDI r2, 343
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
