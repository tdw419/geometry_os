; DESCRIPTION: Composite: . Then Places a magenta dot at position (10, 11). Then Draws a magenta circle centered at (125, 121) with radius 44.
; PLAN: r0=10(x), r1=11(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=125(x), r1=121(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (10, 11).
; PLAN: r0=10(x), r1=11(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 11
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (125, 121) with radius 44.
; PLAN: r0=125(x), r1=121(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 121
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
