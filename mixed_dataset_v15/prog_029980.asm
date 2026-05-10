; DESCRIPTION: Creates a black circular shape at (243, 43) with radius 38.
; PLAN: r0=243(x), r1=43(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 43
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
