; DESCRIPTION: Creates a white circular shape at (173, 198) with radius 53.
; PLAN: r0=173(x), r1=198(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 198
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
