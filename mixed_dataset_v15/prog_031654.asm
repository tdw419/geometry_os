; DESCRIPTION: Renders a black line between points (374, 21) and (496, 32).
; PLAN: r0=374(x1), r1=21(y1), r2=496(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 21
LDI r2, 496
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
