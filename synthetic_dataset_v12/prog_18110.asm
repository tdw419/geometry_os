; DESCRIPTION: Creates a white circular shape at (385, 232) with radius 16.
; PLAN: r0=385(x), r1=232(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 232
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
