; DESCRIPTION: Places a blue line segment connecting (116, 247) to (195, 105).
; PLAN: r0=116(x1), r1=247(y1), r2=195(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 247
LDI r2, 195
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
