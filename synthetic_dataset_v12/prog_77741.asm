; DESCRIPTION: Creates a blue circular shape at (111, 163) with radius 24.
; PLAN: r0=111(x), r1=163(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 163
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
