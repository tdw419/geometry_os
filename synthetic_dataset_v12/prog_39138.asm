; DESCRIPTION: Places a yellow circle of radius 45 at center (151, 151).
; PLAN: r0=151(x), r1=151(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 151
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
