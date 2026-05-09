; DESCRIPTION: Creates a green circular shape at (108, 83) with radius 42.
; PLAN: r0=108(x), r1=83(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 83
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
