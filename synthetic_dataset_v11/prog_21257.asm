; DESCRIPTION: Places a black line segment connecting (13, 241) to (72, 31).
; PLAN: r0=13(x1), r1=241(y1), r2=72(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 241
LDI r2, 72
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
