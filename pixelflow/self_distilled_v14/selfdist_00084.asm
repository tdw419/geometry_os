; DESCRIPTION: Renders a white circular shape at (173, 2) with radius 20.
; PLAN: r0=173(x), r1=2(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 2
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
