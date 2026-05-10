; DESCRIPTION: Renders a white circular shape at (134, 93) with radius 48.
; PLAN: r0=134(x), r1=93(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 93
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
