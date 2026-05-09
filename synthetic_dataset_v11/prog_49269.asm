; DESCRIPTION: Places a magenta circle of radius 47 at center (54, 84).
; PLAN: r0=54(x), r1=84(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 84
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
