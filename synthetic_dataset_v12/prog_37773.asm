; DESCRIPTION: Renders a black disk with center (218, 29) and radius 12.
; PLAN: r0=218(x), r1=29(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 29
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
