; DESCRIPTION: Creates a green circular shape at (42, 75) with radius 42.
; PLAN: r0=42(x), r1=75(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 75
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
