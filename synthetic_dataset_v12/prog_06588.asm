; DESCRIPTION: Places a green line segment connecting (341, 234) to (47, 116).
; PLAN: r0=341(x1), r1=234(y1), r2=47(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 234
LDI r2, 47
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
