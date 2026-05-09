; DESCRIPTION: Places a magenta circle of radius 72 at center (170, 74).
; PLAN: r0=170(x), r1=74(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 74
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
