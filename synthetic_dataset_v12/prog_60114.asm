; DESCRIPTION: Places a black line segment connecting (478, 153) to (321, 14).
; PLAN: r0=478(x1), r1=153(y1), r2=321(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 153
LDI r2, 321
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
