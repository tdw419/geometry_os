; DESCRIPTION: Places a blue line segment connecting (387, 142) to (19, 2).
; PLAN: r0=387(x1), r1=142(y1), r2=19(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 142
LDI r2, 19
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
