; DESCRIPTION: Places a black line segment connecting (461, 222) to (153, 140).
; PLAN: r0=461(x1), r1=222(y1), r2=153(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 222
LDI r2, 153
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
