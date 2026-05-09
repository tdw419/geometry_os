; DESCRIPTION: Places a black line segment connecting (366, 192) to (141, 125).
; PLAN: r0=366(x1), r1=192(y1), r2=141(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 192
LDI r2, 141
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
