; DESCRIPTION: Places a magenta disk with center (339, 32) and radius 64.
; PLAN: r0=339(x), r1=32(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 32
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
