; DESCRIPTION: Creates a orange circular shape at (140, 103) with radius 59.
; PLAN: r0=140(x), r1=103(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 103
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
