; DESCRIPTION: Renders a yellow circular shape at (181, 108) with radius 47.
; PLAN: r0=181(x), r1=108(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 108
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
