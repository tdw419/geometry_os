; DESCRIPTION: Places a magenta circle of radius 76 at center (214, 110).
; PLAN: r0=214(x), r1=110(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 110
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
