; DESCRIPTION: Places a magenta circle of radius 37 at center (100, 151).
; PLAN: r0=100(x), r1=151(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 151
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
