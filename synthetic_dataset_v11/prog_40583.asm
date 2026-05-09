; DESCRIPTION: Composite: . Then Places a blue dot at position (161, 167). Then Draws a black circle centered at (105, 150) with radius 73.
; PLAN: r0=161(x), r1=167(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=105(x), r1=150(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (161, 167).
; PLAN: r0=161(x), r1=167(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 167
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (105, 150) with radius 73.
; PLAN: r0=105(x), r1=150(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 150
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
