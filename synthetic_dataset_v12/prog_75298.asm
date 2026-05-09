; DESCRIPTION: Places a magenta circle of radius 67 at center (334, 140).
; PLAN: r0=334(x), r1=140(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 140
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
