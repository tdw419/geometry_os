; DESCRIPTION: Renders a yellow circular shape at (139, 183) with radius 42.
; PLAN: r0=139(x), r1=183(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 183
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
