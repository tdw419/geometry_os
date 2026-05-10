; DESCRIPTION: Creates a blue circular shape at (103, 171) with radius 47.
; PLAN: r0=103(x), r1=171(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 171
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
