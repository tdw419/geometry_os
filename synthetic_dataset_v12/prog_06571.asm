; DESCRIPTION: Places a magenta circle of radius 59 at center (109, 164).
; PLAN: r0=109(x), r1=164(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 164
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
