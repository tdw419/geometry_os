; DESCRIPTION: Places a magenta circle of radius 51 at center (382, 103).
; PLAN: r0=382(x), r1=103(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 103
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
