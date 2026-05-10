; DESCRIPTION: Places a magenta circle of radius 56 at center (179, 135).
; PLAN: r0=179(x), r1=135(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 135
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
