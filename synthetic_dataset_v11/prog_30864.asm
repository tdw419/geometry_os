; DESCRIPTION: Composite: . Then Places a orange dot at position (91, 47). Then Draws a magenta circle centered at (101, 78) with radius 76.
; PLAN: r0=91(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=101(x), r1=78(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (91, 47).
; PLAN: r0=91(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (101, 78) with radius 76.
; PLAN: r0=101(x), r1=78(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 78
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
