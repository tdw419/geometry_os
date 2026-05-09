; DESCRIPTION: Places a magenta circle of radius 19 at center (24, 142).
; PLAN: r0=24(x), r1=142(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 142
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
