; DESCRIPTION: Places a magenta circle of radius 40 at center (346, 151).
; PLAN: r0=346(x), r1=151(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 151
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
