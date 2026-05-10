; DESCRIPTION: Renders a blue circular shape at (24, 121) with radius 48.
; PLAN: r0=24(x), r1=121(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 121
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
