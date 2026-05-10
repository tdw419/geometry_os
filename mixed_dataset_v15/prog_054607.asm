; DESCRIPTION: Creates a orange circular shape at (256, 165) with radius 76.
; PLAN: r0=256(x), r1=165(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 165
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
