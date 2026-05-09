; DESCRIPTION: Creates a orange circular shape at (76, 154) with radius 64.
; PLAN: r0=76(x), r1=154(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 154
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
