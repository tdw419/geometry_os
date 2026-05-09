; DESCRIPTION: Creates a white circular shape at (108, 166) with radius 35.
; PLAN: r0=108(x), r1=166(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 166
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
