; DESCRIPTION: Creates a green circular shape at (452, 138) with radius 59.
; PLAN: r0=452(x), r1=138(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 138
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
