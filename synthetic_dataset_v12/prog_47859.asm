; DESCRIPTION: Creates a orange circular shape at (269, 165) with radius 31.
; PLAN: r0=269(x), r1=165(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 165
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
