; DESCRIPTION: Places a black line segment connecting (223, 56) to (33, 22).
; PLAN: r0=223(x1), r1=56(y1), r2=33(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 56
LDI r2, 33
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
