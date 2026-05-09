; DESCRIPTION: Places a blue circle of radius 54 at center (165, 151).
; PLAN: r0=165(x), r1=151(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 151
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
