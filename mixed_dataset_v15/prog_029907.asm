; DESCRIPTION: Renders a green circular shape at (42, 83) with radius 19.
; PLAN: r0=42(x), r1=83(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 83
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
