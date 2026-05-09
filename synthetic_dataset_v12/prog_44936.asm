; DESCRIPTION: Places a magenta circle of radius 62 at center (157, 96).
; PLAN: r0=157(x), r1=96(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 96
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
