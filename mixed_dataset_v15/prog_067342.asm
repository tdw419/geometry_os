; DESCRIPTION: Places a magenta circle of radius 62 at center (184, 123).
; PLAN: r0=184(x), r1=123(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 123
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
