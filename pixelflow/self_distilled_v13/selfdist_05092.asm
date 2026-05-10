; DESCRIPTION: Renders a yellow circular shape at (335, 181) with radius 48.
; PLAN: r0=335(x), r1=181(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 181
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
