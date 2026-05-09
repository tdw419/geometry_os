; DESCRIPTION: Places a magenta circle of radius 24 at center (175, 181).
; PLAN: r0=175(x), r1=181(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 181
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
