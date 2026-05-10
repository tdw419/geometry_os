; DESCRIPTION: Places a black line segment connecting (77, 173) to (244, 1).
; PLAN: r0=77(x1), r1=173(y1), r2=244(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 173
LDI r2, 244
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
