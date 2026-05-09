; DESCRIPTION: Renders a orange disk with center (215, 136) and radius 64.
; PLAN: r0=215(x), r1=136(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 136
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
