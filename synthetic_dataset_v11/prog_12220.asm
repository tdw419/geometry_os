; DESCRIPTION: Creates a blue circular shape at (206, 26) with radius 14.
; PLAN: r0=206(x), r1=26(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 26
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
