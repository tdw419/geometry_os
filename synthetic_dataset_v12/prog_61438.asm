; DESCRIPTION: Creates a black circular shape at (437, 109) with radius 59.
; PLAN: r0=437(x), r1=109(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 109
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
