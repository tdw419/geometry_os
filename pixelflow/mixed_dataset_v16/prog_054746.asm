; DESCRIPTION: Renders a white circular shape at (394, 103) with radius 76.
; PLAN: r0=394(x), r1=103(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 103
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
