; DESCRIPTION: Places a black line segment connecting (219, 38) to (129, 108).
; PLAN: r0=219(x1), r1=38(y1), r2=129(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 38
LDI r2, 129
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
