; DESCRIPTION: Draws a white circle centered at (167, 154) with radius 66.
; PLAN: r0=167(x), r1=154(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 154
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
