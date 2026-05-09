; DESCRIPTION: Places a black line segment connecting (234, 18) to (224, 45).
; PLAN: r0=234(x1), r1=18(y1), r2=224(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 18
LDI r2, 224
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
