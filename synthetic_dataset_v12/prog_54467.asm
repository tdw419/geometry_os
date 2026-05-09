; DESCRIPTION: Creates a blue circular shape at (184, 126) with radius 59.
; PLAN: r0=184(x), r1=126(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 126
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
