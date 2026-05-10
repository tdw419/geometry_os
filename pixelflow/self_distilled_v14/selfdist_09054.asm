; DESCRIPTION: Renders a white circular shape at (73, 183) with radius 80.
; PLAN: r0=73(x), r1=183(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 183
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
