; DESCRIPTION: Places a magenta circle of radius 53 at center (267, 81).
; PLAN: r0=267(x), r1=81(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 81
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
