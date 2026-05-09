; DESCRIPTION: Places a magenta circle of radius 61 at center (150, 81).
; PLAN: r0=150(x), r1=81(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 81
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
