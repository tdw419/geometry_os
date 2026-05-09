; DESCRIPTION: Renders a orange disk with center (144, 171) and radius 64.
; PLAN: r0=144(x), r1=171(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 171
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
