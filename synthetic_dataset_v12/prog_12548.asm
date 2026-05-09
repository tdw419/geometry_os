; DESCRIPTION: Places a black line segment connecting (234, 224) to (312, 105).
; PLAN: r0=234(x1), r1=224(y1), r2=312(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 224
LDI r2, 312
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
