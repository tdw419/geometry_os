; DESCRIPTION: Places a purple line segment connecting (429, 184) to (248, 112).
; PLAN: r0=429(x1), r1=184(y1), r2=248(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 184
LDI r2, 248
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
