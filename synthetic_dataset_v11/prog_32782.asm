; DESCRIPTION: Draws a white circle centered at (128, 147) with radius 78.
; PLAN: r0=128(x), r1=147(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 147
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
