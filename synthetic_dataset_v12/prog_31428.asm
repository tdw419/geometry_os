; DESCRIPTION: Creates a white circular shape at (385, 181) with radius 14.
; PLAN: r0=385(x), r1=181(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 181
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
