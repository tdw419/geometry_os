; DESCRIPTION: Renders a blue circular shape at (65, 0) with radius 56.
; PLAN: r0=65(x), r1=0(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 0
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
