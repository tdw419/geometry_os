; DESCRIPTION: Creates a black circular shape at (173, 164) with radius 44.
; PLAN: r0=173(x), r1=164(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 164
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
