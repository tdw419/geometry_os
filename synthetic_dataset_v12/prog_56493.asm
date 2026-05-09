; DESCRIPTION: Places a black line segment connecting (509, 56) to (461, 48).
; PLAN: r0=509(x1), r1=56(y1), r2=461(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 56
LDI r2, 461
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
