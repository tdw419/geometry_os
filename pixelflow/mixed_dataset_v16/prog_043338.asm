; DESCRIPTION: Draws a yellow circle centered at (191, 128) with radius 62.
; PLAN: r0=191(x), r1=128(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 128
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
