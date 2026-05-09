; DESCRIPTION: Places a magenta circle of radius 58 at center (338, 81).
; PLAN: r0=338(x), r1=81(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 81
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
