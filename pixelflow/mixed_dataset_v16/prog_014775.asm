; DESCRIPTION: Draws a white circle centered at (345, 159) with radius 29.
; PLAN: r0=345(x), r1=159(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 159
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
