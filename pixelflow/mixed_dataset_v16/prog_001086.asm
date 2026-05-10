; DESCRIPTION: Places a blue line segment connecting (483, 143) to (429, 199).
; PLAN: r0=483(x1), r1=143(y1), r2=429(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 143
LDI r2, 429
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
