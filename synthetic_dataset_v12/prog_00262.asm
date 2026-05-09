; DESCRIPTION: Places a blue line segment connecting (239, 87) to (506, 217).
; PLAN: r0=239(x1), r1=87(y1), r2=506(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 87
LDI r2, 506
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
