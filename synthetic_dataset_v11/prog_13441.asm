; DESCRIPTION: Draws a yellow circle centered at (217, 224) with radius 11.
; PLAN: r0=217(x), r1=224(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 224
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
