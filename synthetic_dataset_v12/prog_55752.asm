; DESCRIPTION: Places a magenta circle of radius 72 at center (164, 178).
; PLAN: r0=164(x), r1=178(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 178
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
