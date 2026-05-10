; DESCRIPTION: Creates a black circular shape at (440, 164) with radius 53.
; PLAN: r0=440(x), r1=164(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 164
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
