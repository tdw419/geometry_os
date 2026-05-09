; DESCRIPTION: Places a magenta circle of radius 40 at center (414, 43).
; PLAN: r0=414(x), r1=43(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 43
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
