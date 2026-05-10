; DESCRIPTION: Creates a orange circular shape at (208, 165) with radius 64.
; PLAN: r0=208(x), r1=165(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 165
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
