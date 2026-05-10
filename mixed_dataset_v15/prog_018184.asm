; DESCRIPTION: Places a magenta circle of radius 27 at center (233, 66).
; PLAN: r0=233(x), r1=66(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 66
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
