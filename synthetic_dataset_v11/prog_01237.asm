; DESCRIPTION: Draws a black circle centered at (53, 125) with radius 42.
; PLAN: r0=53(x), r1=125(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 125
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
