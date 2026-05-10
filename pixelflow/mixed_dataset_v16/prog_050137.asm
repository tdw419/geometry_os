; DESCRIPTION: Renders a white circular shape at (87, 85) with radius 61.
; PLAN: r0=87(x), r1=85(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 85
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
