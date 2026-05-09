; DESCRIPTION: Renders a black disk with center (473, 173) and radius 14.
; PLAN: r0=473(x), r1=173(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 173
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
