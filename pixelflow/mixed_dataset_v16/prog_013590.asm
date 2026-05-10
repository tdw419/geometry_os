; DESCRIPTION: Places a purple line segment connecting (387, 84) to (414, 196).
; PLAN: r0=387(x1), r1=84(y1), r2=414(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 84
LDI r2, 414
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
