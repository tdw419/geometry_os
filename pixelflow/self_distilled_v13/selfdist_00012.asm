; DESCRIPTION: Renders a white circular shape at (223, 131) with radius 73.
; PLAN: r0=223(x), r1=131(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 131
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
