; DESCRIPTION: Places a blue line segment connecting (394, 232) to (471, 250).
; PLAN: r0=394(x1), r1=232(y1), r2=471(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 232
LDI r2, 471
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
