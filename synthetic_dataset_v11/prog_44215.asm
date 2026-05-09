; DESCRIPTION: Places a magenta circle of radius 24 at center (214, 189).
; PLAN: r0=214(x), r1=189(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 189
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
