; DESCRIPTION: Places a black circle of radius 76 at center (187, 151).
; PLAN: r0=187(x), r1=151(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 151
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
