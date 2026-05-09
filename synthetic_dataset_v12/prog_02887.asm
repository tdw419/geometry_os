; DESCRIPTION: Places a yellow line segment connecting (511, 116) to (83, 145).
; PLAN: r0=511(x1), r1=116(y1), r2=83(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 116
LDI r2, 83
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
