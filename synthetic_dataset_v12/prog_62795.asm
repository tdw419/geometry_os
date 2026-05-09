; DESCRIPTION: Places a yellow line segment connecting (363, 116) to (122, 238).
; PLAN: r0=363(x1), r1=116(y1), r2=122(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 116
LDI r2, 122
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
