; DESCRIPTION: Creates a blue circular shape at (161, 53) with radius 47.
; PLAN: r0=161(x), r1=53(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 53
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
