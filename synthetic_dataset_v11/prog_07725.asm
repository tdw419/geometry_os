; DESCRIPTION: Places a black line segment connecting (85, 191) to (251, 219).
; PLAN: r0=85(x1), r1=191(y1), r2=251(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 191
LDI r2, 251
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
