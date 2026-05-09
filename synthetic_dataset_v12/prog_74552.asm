; DESCRIPTION: Places a black line segment connecting (24, 40) to (227, 32).
; PLAN: r0=24(x1), r1=40(y1), r2=227(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 40
LDI r2, 227
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
