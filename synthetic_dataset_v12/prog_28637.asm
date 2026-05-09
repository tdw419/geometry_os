; DESCRIPTION: Places a black line segment connecting (504, 194) to (2, 181).
; PLAN: r0=504(x1), r1=194(y1), r2=2(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 194
LDI r2, 2
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
