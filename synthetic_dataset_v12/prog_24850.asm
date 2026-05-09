; DESCRIPTION: Places a orange circle of radius 73 at center (189, 151).
; PLAN: r0=189(x), r1=151(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 151
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
