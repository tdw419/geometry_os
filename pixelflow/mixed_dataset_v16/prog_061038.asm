; DESCRIPTION: Renders a orange circular shape at (382, 136) with radius 32.
; PLAN: r0=382(x), r1=136(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 136
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
