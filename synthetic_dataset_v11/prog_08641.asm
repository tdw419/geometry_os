; DESCRIPTION: Creates a blue circular shape at (148, 171) with radius 28.
; PLAN: r0=148(x), r1=171(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 171
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
