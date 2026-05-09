; DESCRIPTION: Creates a blue circular shape at (252, 171) with radius 59.
; PLAN: r0=252(x), r1=171(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 171
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
