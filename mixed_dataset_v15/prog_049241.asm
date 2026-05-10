; DESCRIPTION: Creates a orange circular shape at (324, 48) with radius 47.
; PLAN: r0=324(x), r1=48(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 48
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
