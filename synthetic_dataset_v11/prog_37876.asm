; DESCRIPTION: Creates a yellow circular shape at (96, 134) with radius 69.
; PLAN: r0=96(x), r1=134(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 134
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
