; DESCRIPTION: Places a magenta circle of radius 35 at center (377, 38).
; PLAN: r0=377(x), r1=38(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 38
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
