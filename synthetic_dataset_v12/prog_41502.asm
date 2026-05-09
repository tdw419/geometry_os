; DESCRIPTION: Places a black line segment connecting (497, 211) to (254, 167).
; PLAN: r0=497(x1), r1=211(y1), r2=254(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 211
LDI r2, 254
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
