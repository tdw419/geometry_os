; DESCRIPTION: Renders a black disk with center (388, 133) and radius 54.
; PLAN: r0=388(x), r1=133(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 133
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
