; DESCRIPTION: Places a black line segment connecting (224, 20) to (236, 46).
; PLAN: r0=224(x1), r1=20(y1), r2=236(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 20
LDI r2, 236
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
