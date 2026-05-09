; DESCRIPTION: Draws a yellow circle centered at (65, 80) with radius 62.
; PLAN: r0=65(x), r1=80(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 80
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
