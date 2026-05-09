; DESCRIPTION: Places a black line segment connecting (163, 204) to (30, 48).
; PLAN: r0=163(x1), r1=204(y1), r2=30(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 204
LDI r2, 30
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
