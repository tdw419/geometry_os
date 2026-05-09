; DESCRIPTION: Places a black line segment connecting (234, 159) to (489, 49).
; PLAN: r0=234(x1), r1=159(y1), r2=489(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 159
LDI r2, 489
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
