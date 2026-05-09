; DESCRIPTION: Renders a orange disk with center (384, 88) and radius 74.
; PLAN: r0=384(x), r1=88(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 88
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
