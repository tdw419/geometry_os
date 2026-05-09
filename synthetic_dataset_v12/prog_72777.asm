; DESCRIPTION: Places a black line segment connecting (198, 149) to (451, 45).
; PLAN: r0=198(x1), r1=149(y1), r2=451(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 149
LDI r2, 451
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
