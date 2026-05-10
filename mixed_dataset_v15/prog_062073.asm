; DESCRIPTION: Places a magenta circle of radius 60 at center (315, 63).
; PLAN: r0=315(x), r1=63(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 63
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
