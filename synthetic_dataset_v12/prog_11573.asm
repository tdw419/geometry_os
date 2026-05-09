; DESCRIPTION: Places a magenta circle of radius 53 at center (228, 140).
; PLAN: r0=228(x), r1=140(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 140
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
