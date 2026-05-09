; DESCRIPTION: Renders a white disk with center (388, 133) and radius 62.
; PLAN: r0=388(x), r1=133(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 133
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
