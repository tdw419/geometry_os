; DESCRIPTION: Places a black line segment connecting (390, 55) to (66, 62).
; PLAN: r0=390(x1), r1=55(y1), r2=66(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 55
LDI r2, 66
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
