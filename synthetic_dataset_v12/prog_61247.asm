; DESCRIPTION: Draws a white circle centered at (173, 189) with radius 24.
; PLAN: r0=173(x), r1=189(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 189
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
