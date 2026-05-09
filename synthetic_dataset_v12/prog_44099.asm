; DESCRIPTION: Places a magenta circle of radius 18 at center (18, 59).
; PLAN: r0=18(x), r1=59(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 59
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
