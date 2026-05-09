; DESCRIPTION: Draws a yellow circle centered at (217, 62) with radius 60.
; PLAN: r0=217(x), r1=62(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 62
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
