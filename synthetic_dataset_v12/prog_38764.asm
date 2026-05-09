; DESCRIPTION: Places a blue circle of radius 64 at center (426, 183).
; PLAN: r0=426(x), r1=183(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 183
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
