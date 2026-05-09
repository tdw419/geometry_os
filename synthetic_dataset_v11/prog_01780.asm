; DESCRIPTION: Draws a white circle centered at (176, 64) with radius 22.
; PLAN: r0=176(x), r1=64(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 64
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
