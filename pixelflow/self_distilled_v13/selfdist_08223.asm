; DESCRIPTION: Renders a white circular shape at (70, 81) with radius 43.
; PLAN: r0=70(x), r1=81(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 81
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
