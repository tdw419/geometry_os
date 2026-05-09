; DESCRIPTION: Places a magenta circle of radius 19 at center (166, 44).
; PLAN: r0=166(x), r1=44(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 44
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
