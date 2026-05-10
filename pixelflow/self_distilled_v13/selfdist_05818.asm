; DESCRIPTION: Places a magenta disk with center (114, 92) and radius 64.
; PLAN: r0=114(x), r1=92(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 92
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
