; DESCRIPTION: Renders a green circular shape at (265, 152) with radius 76.
; PLAN: r0=265(x), r1=152(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 152
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
