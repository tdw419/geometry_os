; DESCRIPTION: Places a black line segment connecting (44, 142) to (234, 8).
; PLAN: r0=44(x1), r1=142(y1), r2=234(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 142
LDI r2, 234
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
