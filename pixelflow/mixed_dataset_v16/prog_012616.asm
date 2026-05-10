; DESCRIPTION: Renders a white circular shape at (121, 144) with radius 32.
; PLAN: r0=121(x), r1=144(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 144
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
