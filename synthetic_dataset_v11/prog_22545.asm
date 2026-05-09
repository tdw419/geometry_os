; DESCRIPTION: Places a green line segment connecting (83, 92) to (119, 192).
; PLAN: r0=83(x1), r1=92(y1), r2=119(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 92
LDI r2, 119
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
