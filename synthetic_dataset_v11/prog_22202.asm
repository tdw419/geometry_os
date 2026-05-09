; DESCRIPTION: Creates a yellow circular shape at (42, 194) with radius 24.
; PLAN: r0=42(x), r1=194(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 194
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
