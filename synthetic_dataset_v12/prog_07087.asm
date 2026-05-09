; DESCRIPTION: Places a blue line segment connecting (347, 134) to (349, 247).
; PLAN: r0=347(x1), r1=134(y1), r2=349(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 134
LDI r2, 349
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
