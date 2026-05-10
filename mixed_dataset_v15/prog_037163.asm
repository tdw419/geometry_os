; DESCRIPTION: Renders a green circular shape at (36, 115) with radius 64.
; PLAN: r0=36(x), r1=115(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 115
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
