; DESCRIPTION: Places a magenta circle of radius 39 at center (376, 43).
; PLAN: r0=376(x), r1=43(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 43
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
