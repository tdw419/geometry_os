; DESCRIPTION: Creates a yellow circular shape at (114, 79) with radius 32.
; PLAN: r0=114(x), r1=79(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 79
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
