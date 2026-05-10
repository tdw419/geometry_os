; DESCRIPTION: Creates a orange circular shape at (209, 166) with radius 61.
; PLAN: r0=209(x), r1=166(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 166
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
