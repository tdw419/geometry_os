; DESCRIPTION: Creates a orange circular shape at (175, 163) with radius 73.
; PLAN: r0=175(x), r1=163(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 163
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
