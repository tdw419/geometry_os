; DESCRIPTION: Draws a yellow circle centered at (141, 108) with radius 64.
; PLAN: r0=141(x), r1=108(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 108
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
