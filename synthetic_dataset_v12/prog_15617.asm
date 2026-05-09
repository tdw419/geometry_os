; DESCRIPTION: Places a magenta circle of radius 17 at center (209, 73).
; PLAN: r0=209(x), r1=73(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 73
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
