; DESCRIPTION: Draws a black circle centered at (168, 34) with radius 29.
; PLAN: r0=168(x), r1=34(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 34
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
