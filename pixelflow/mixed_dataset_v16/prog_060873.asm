; DESCRIPTION: Places a magenta circle of radius 46 at center (159, 105).
; PLAN: r0=159(x), r1=105(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 105
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
