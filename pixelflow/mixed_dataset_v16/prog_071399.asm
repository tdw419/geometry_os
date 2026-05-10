; DESCRIPTION: Renders a white circular shape at (173, 105) with radius 22.
; PLAN: r0=173(x), r1=105(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 105
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
