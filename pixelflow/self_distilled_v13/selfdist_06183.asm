; DESCRIPTION: Renders a yellow circular shape at (315, 130) with radius 63.
; PLAN: r0=315(x), r1=130(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 130
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
