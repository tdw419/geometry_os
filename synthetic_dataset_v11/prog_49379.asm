; DESCRIPTION: Places a blue line segment connecting (62, 191) to (126, 41).
; PLAN: r0=62(x1), r1=191(y1), r2=126(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 191
LDI r2, 126
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
