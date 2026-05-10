; DESCRIPTION: Draws a white circle centered at (449, 226) with radius 24.
; PLAN: r0=449(x), r1=226(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 226
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
