; DESCRIPTION: Creates a blue circular shape at (33, 178) with radius 28.
; PLAN: r0=33(x), r1=178(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 178
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
