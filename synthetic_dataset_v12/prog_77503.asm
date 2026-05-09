; DESCRIPTION: Draws a yellow circle centered at (299, 80) with radius 29.
; PLAN: r0=299(x), r1=80(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 80
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
