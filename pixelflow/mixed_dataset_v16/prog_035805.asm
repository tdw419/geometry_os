; DESCRIPTION: Places a black line segment connecting (104, 15) to (173, 201).
; PLAN: r0=104(x1), r1=15(y1), r2=173(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 15
LDI r2, 173
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
