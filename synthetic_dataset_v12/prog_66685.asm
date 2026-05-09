; DESCRIPTION: Creates a orange circular shape at (444, 128) with radius 67.
; PLAN: r0=444(x), r1=128(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 128
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
