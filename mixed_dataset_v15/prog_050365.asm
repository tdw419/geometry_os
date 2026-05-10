; DESCRIPTION: Places a black line segment connecting (54, 191) to (393, 135).
; PLAN: r0=54(x1), r1=191(y1), r2=393(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 191
LDI r2, 393
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
