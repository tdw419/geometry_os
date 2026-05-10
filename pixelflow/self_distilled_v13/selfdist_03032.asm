; DESCRIPTION: Renders a white circular shape at (237, 157) with radius 51.
; PLAN: r0=237(x), r1=157(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 157
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
