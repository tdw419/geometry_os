; DESCRIPTION: Places a black line segment connecting (12, 181) to (244, 124).
; PLAN: r0=12(x1), r1=181(y1), r2=244(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 181
LDI r2, 244
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
