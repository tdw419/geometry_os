; DESCRIPTION: Places a magenta circle of radius 22 at center (182, 49).
; PLAN: r0=182(x), r1=49(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 49
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
