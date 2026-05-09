; DESCRIPTION: Places a magenta circle of radius 75 at center (100, 135).
; PLAN: r0=100(x), r1=135(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 135
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
