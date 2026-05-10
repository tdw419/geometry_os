; DESCRIPTION: Renders a blue circular shape at (167, 45) with radius 20.
; PLAN: r0=167(x), r1=45(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 45
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
