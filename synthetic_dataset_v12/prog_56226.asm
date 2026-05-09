; DESCRIPTION: Places a white line segment connecting (506, 191) to (374, 255).
; PLAN: r0=506(x1), r1=191(y1), r2=374(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 191
LDI r2, 374
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
