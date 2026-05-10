; DESCRIPTION: Renders a green circular shape at (340, 196) with radius 79.
; PLAN: r0=340(x), r1=196(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 196
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
