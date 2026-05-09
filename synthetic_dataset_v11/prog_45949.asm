; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (122, 30). Then Draws a magenta circle centered at (96, 187) with radius 40.
; PLAN: r0=122(x), r1=30(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=96(x), r1=187(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (122, 30).
; PLAN: r0=122(x), r1=30(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 30
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (96, 187) with radius 40.
; PLAN: r0=96(x), r1=187(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 187
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
