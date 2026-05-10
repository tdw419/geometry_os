; DESCRIPTION: Draws a white circle centered at (32, 167) with radius 27.
; PLAN: r0=32(x), r1=167(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 167
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
