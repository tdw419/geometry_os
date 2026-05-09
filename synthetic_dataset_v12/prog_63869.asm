; DESCRIPTION: Renders a black line between points (219, 245) and (108, 189).
; PLAN: r0=219(x1), r1=245(y1), r2=108(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 245
LDI r2, 108
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
