; DESCRIPTION: Places a black line segment connecting (114, 224) to (222, 47).
; PLAN: r0=114(x1), r1=224(y1), r2=222(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 224
LDI r2, 222
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
