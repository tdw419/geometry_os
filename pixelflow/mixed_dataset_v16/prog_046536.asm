; DESCRIPTION: Places a magenta circle of radius 54 at center (372, 103).
; PLAN: r0=372(x), r1=103(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 103
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
