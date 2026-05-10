; DESCRIPTION: Renders a green circular shape at (173, 70) with radius 74.
; PLAN: r0=173(x), r1=70(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 70
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
