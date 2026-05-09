; DESCRIPTION: Draws a white circle centered at (173, 112) with radius 72.
; PLAN: r0=173(x), r1=112(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 112
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
