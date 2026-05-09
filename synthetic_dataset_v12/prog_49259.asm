; DESCRIPTION: Draws a yellow circle centered at (285, 129) with radius 48.
; PLAN: r0=285(x), r1=129(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 129
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
