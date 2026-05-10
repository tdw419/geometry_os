; DESCRIPTION: Places a blue line segment connecting (145, 241) to (151, 141).
; PLAN: r0=145(x1), r1=241(y1), r2=151(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 241
LDI r2, 151
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
