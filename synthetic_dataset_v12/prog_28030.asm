; DESCRIPTION: Places a black line segment connecting (359, 191) to (120, 159).
; PLAN: r0=359(x1), r1=191(y1), r2=120(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 191
LDI r2, 120
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
