; DESCRIPTION: Places a magenta circle of radius 11 at center (191, 43).
; PLAN: r0=191(x), r1=43(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 43
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
