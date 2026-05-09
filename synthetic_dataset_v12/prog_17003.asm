; DESCRIPTION: Places a black line segment connecting (487, 241) to (490, 96).
; PLAN: r0=487(x1), r1=241(y1), r2=490(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 241
LDI r2, 490
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
