; DESCRIPTION: Draws a black circle centered at (207, 42) with radius 28.
; PLAN: r0=207(x), r1=42(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 42
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
