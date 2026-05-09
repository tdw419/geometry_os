; DESCRIPTION: Draws a yellow circle centered at (217, 32) with radius 10.
; PLAN: r0=217(x), r1=32(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 32
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
