; DESCRIPTION: Places a magenta circle of radius 57 at center (86, 67).
; PLAN: r0=86(x), r1=67(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 67
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
