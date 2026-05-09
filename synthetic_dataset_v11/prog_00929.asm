; DESCRIPTION: Places a black line segment connecting (123, 191) to (137, 83).
; PLAN: r0=123(x1), r1=191(y1), r2=137(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 191
LDI r2, 137
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
