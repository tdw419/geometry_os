; DESCRIPTION: Draws a magenta circle centered at (393, 59) with radius 53.
; PLAN: r0=393(x), r1=59(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 59
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
