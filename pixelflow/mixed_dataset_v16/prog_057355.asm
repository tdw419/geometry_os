; DESCRIPTION: Creates a orange circular shape at (27, 68) with radius 24.
; PLAN: r0=27(x), r1=68(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 68
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
