; DESCRIPTION: Draws a black circle centered at (42, 165) with radius 31.
; PLAN: r0=42(x), r1=165(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 165
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
