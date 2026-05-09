; DESCRIPTION: Places a magenta circle of radius 37 at center (412, 56).
; PLAN: r0=412(x), r1=56(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 56
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
