; DESCRIPTION: Places a black line segment connecting (363, 242) to (199, 163).
; PLAN: r0=363(x1), r1=242(y1), r2=199(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 242
LDI r2, 199
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
