; DESCRIPTION: Places a black line segment connecting (258, 83) to (116, 102).
; PLAN: r0=258(x1), r1=83(y1), r2=116(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 83
LDI r2, 116
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
