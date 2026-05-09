; DESCRIPTION: Places a black line segment connecting (495, 18) to (402, 99).
; PLAN: r0=495(x1), r1=18(y1), r2=402(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 18
LDI r2, 402
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
