; DESCRIPTION: Places a magenta circle of radius 71 at center (200, 104).
; PLAN: r0=200(x), r1=104(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 104
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
