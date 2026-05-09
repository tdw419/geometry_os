; DESCRIPTION: Places a black line segment connecting (166, 192) to (250, 181).
; PLAN: r0=166(x1), r1=192(y1), r2=250(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 192
LDI r2, 250
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
