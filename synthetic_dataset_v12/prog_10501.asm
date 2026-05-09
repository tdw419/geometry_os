; DESCRIPTION: Places a green line segment connecting (379, 136) to (395, 36).
; PLAN: r0=379(x1), r1=136(y1), r2=395(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 136
LDI r2, 395
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
