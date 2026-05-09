; DESCRIPTION: Draws a black circle centered at (95, 226) with radius 24.
; PLAN: r0=95(x), r1=226(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 226
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
