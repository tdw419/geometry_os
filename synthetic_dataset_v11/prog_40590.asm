; DESCRIPTION: Composite: . Then Places a magenta dot at position (25, 144). Then Draws a blue circle centered at (123, 119) with radius 78.
; PLAN: r0=25(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=123(x), r1=119(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (25, 144).
; PLAN: r0=25(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (123, 119) with radius 78.
; PLAN: r0=123(x), r1=119(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 119
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
