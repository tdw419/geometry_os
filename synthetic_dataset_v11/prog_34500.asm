; DESCRIPTION: Creates a black circular shape at (59, 143) with radius 48.
; PLAN: r0=59(x), r1=143(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 143
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
