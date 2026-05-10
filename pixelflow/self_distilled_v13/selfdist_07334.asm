; DESCRIPTION: Renders a white circular shape at (132, 96) with radius 52.
; PLAN: r0=132(x), r1=96(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 96
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
