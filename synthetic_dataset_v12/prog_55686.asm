; DESCRIPTION: Places a green line segment connecting (402, 66) to (495, 123).
; PLAN: r0=402(x1), r1=66(y1), r2=495(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 66
LDI r2, 495
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
