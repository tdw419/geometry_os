; DESCRIPTION: Places a magenta disk with center (384, 113) and radius 73.
; PLAN: r0=384(x), r1=113(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 113
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
