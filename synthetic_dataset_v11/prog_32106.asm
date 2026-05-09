; DESCRIPTION: Places a magenta circle of radius 59 at center (62, 75).
; PLAN: r0=62(x), r1=75(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 75
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
