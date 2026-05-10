; DESCRIPTION: Renders a white circular shape at (113, 5) with radius 74.
; PLAN: r0=113(x), r1=5(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 5
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
