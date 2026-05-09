; DESCRIPTION: Creates a yellow circular shape at (144, 194) with radius 42.
; PLAN: r0=144(x), r1=194(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 194
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
