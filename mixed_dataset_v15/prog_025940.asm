; DESCRIPTION: Renders a blue circular shape at (111, 73) with radius 22.
; PLAN: r0=111(x), r1=73(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 73
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
