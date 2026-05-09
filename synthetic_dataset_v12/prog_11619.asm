; DESCRIPTION: Places a blue line segment connecting (133, 56) to (424, 51).
; PLAN: r0=133(x1), r1=56(y1), r2=424(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 56
LDI r2, 424
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
