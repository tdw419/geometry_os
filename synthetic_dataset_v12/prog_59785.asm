; DESCRIPTION: Creates a yellow circular shape at (425, 42) with radius 13.
; PLAN: r0=425(x), r1=42(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 42
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
