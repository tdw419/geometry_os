; DESCRIPTION: Places a black line segment connecting (429, 43) to (461, 1).
; PLAN: r0=429(x1), r1=43(y1), r2=461(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 43
LDI r2, 461
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
