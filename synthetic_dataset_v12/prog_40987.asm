; DESCRIPTION: Creates a black circular shape at (375, 133) with radius 32.
; PLAN: r0=375(x), r1=133(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 133
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
