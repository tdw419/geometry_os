; DESCRIPTION: Creates a white circular shape at (116, 138) with radius 59.
; PLAN: r0=116(x), r1=138(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 138
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
