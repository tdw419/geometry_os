; DESCRIPTION: Composite: . Then Places a magenta dot at position (183, 22). Then Draws a magenta circle centered at (72, 58) with radius 39.
; PLAN: r0=183(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=72(x), r1=58(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (183, 22).
; PLAN: r0=183(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (72, 58) with radius 39.
; PLAN: r0=72(x), r1=58(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 58
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
