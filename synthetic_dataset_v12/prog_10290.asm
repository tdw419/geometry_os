; DESCRIPTION: Creates a blue circular shape at (406, 76) with radius 76.
; PLAN: r0=406(x), r1=76(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 76
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
