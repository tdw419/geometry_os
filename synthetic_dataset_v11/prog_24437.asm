; DESCRIPTION: Places a magenta circle of radius 71 at center (116, 151).
; PLAN: r0=116(x), r1=151(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 151
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
