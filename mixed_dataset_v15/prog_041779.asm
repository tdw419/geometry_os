; DESCRIPTION: Creates a orange circular shape at (142, 176) with radius 59.
; PLAN: r0=142(x), r1=176(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 176
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
