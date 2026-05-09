; DESCRIPTION: Places a black line segment connecting (245, 64) to (250, 136).
; PLAN: r0=245(x1), r1=64(y1), r2=250(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 64
LDI r2, 250
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
