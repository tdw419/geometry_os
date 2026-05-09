; DESCRIPTION: Places a magenta circle of radius 69 at center (179, 175).
; PLAN: r0=179(x), r1=175(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 175
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
