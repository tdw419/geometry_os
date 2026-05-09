; DESCRIPTION: Draws a white circle centered at (397, 239) with radius 14.
; PLAN: r0=397(x), r1=239(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 239
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
