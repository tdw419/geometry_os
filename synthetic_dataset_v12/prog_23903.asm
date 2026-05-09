; DESCRIPTION: Places a black line segment connecting (288, 63) to (395, 160).
; PLAN: r0=288(x1), r1=63(y1), r2=395(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 63
LDI r2, 395
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
