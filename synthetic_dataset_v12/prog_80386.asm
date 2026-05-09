; DESCRIPTION: Creates a orange circular shape at (473, 174) with radius 14.
; PLAN: r0=473(x), r1=174(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 174
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
