; DESCRIPTION: Places a black line segment connecting (45, 104) to (222, 123).
; PLAN: r0=45(x1), r1=104(y1), r2=222(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 104
LDI r2, 222
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
