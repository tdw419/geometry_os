; DESCRIPTION: Places a black line segment connecting (224, 214) to (106, 23).
; PLAN: r0=224(x1), r1=214(y1), r2=106(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 214
LDI r2, 106
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
