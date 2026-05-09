; DESCRIPTION: Places a black line segment connecting (59, 199) to (321, 11).
; PLAN: r0=59(x1), r1=199(y1), r2=321(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 199
LDI r2, 321
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
