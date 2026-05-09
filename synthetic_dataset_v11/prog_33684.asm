; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (41, 180) with radius 20. Then Places a magenta dot at position (158, 191).
; PLAN: r0=41(x), r1=180(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (41, 180) with radius 20.
; PLAN: r0=41(x), r1=180(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 180
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (158, 191).
; PLAN: r0=158(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 191
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
