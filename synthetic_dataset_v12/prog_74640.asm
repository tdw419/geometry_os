; DESCRIPTION: Places a magenta circle of radius 59 at center (237, 153).
; PLAN: r0=237(x), r1=153(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 153
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
