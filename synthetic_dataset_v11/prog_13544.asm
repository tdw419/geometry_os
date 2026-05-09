; DESCRIPTION: Places a magenta circle of radius 14 at center (88, 116).
; PLAN: r0=88(x), r1=116(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 116
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
