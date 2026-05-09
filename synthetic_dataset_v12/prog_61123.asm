; DESCRIPTION: Places a black line segment connecting (96, 46) to (422, 110).
; PLAN: r0=96(x1), r1=46(y1), r2=422(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 46
LDI r2, 422
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
