; DESCRIPTION: Places a magenta circle of radius 76 at center (134, 164).
; PLAN: r0=134(x), r1=164(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 164
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
