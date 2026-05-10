; DESCRIPTION: Renders a white circular shape at (249, 140) with radius 41.
; PLAN: r0=249(x), r1=140(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 140
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
