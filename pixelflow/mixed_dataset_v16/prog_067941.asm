; DESCRIPTION: Draws a white circle centered at (112, 224) with radius 10.
; PLAN: r0=112(x), r1=224(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 224
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
