; DESCRIPTION: Creates a black circular shape at (120, 161) with radius 59.
; PLAN: r0=120(x), r1=161(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 161
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
