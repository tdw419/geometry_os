; DESCRIPTION: Places a magenta circle of radius 52 at center (59, 134).
; PLAN: r0=59(x), r1=134(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 134
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
