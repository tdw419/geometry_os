; DESCRIPTION: Places a black line segment connecting (451, 155) to (387, 165).
; PLAN: r0=451(x1), r1=155(y1), r2=387(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 155
LDI r2, 387
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
