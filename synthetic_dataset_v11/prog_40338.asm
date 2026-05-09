; DESCRIPTION: Places a black line segment connecting (245, 133) to (184, 17).
; PLAN: r0=245(x1), r1=133(y1), r2=184(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 133
LDI r2, 184
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
