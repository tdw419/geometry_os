; DESCRIPTION: Places a black line segment connecting (477, 185) to (363, 237).
; PLAN: r0=477(x1), r1=185(y1), r2=363(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 185
LDI r2, 363
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
