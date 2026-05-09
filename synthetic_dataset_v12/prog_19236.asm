; DESCRIPTION: Places a magenta circle of radius 77 at center (81, 140).
; PLAN: r0=81(x), r1=140(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 140
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
