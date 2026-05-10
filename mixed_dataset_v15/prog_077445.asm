; DESCRIPTION: Draws a yellow circle centered at (397, 27) with radius 18.
; PLAN: r0=397(x), r1=27(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 27
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
