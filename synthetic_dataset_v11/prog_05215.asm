; DESCRIPTION: Places a magenta circle of radius 66 at center (167, 178).
; PLAN: r0=167(x), r1=178(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 178
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
