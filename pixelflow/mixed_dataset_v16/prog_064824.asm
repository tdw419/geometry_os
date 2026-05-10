; DESCRIPTION: Renders a yellow circular shape at (268, 132) with radius 42.
; PLAN: r0=268(x), r1=132(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 132
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
