; DESCRIPTION: Renders a white circular shape at (10, 44) with radius 78.
; PLAN: r0=10(x), r1=44(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 10
LDI r1, 44
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
