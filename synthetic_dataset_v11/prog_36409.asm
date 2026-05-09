; DESCRIPTION: Composite: . Then Places a orange dot at position (140, 116). Then Draws a magenta circle centered at (74, 108) with radius 40.
; PLAN: r0=140(x), r1=116(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=74(x), r1=108(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (140, 116).
; PLAN: r0=140(x), r1=116(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 116
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (74, 108) with radius 40.
; PLAN: r0=74(x), r1=108(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 108
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
