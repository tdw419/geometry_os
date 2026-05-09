; DESCRIPTION: Creates a black circular shape at (230, 161) with radius 10.
; PLAN: r0=230(x), r1=161(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 161
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
