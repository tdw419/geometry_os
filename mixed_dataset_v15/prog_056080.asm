; DESCRIPTION: Renders a green circular shape at (202, 189) with radius 73.
; PLAN: r0=202(x), r1=189(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 189
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
