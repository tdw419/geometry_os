; DESCRIPTION: Creates a orange circular shape at (98, 64) with radius 47.
; PLAN: r0=98(x), r1=64(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 64
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
