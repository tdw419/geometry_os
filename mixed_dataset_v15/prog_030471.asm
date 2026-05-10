; DESCRIPTION: Places a black line segment connecting (12, 153) to (321, 59).
; PLAN: r0=12(x1), r1=153(y1), r2=321(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 153
LDI r2, 321
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
