; DESCRIPTION: Renders a blue circular shape at (263, 35) with radius 10.
; PLAN: r0=263(x), r1=35(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 35
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
