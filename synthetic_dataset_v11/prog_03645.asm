; DESCRIPTION: Composite: . Then Places a blue dot at position (111, 62). Then Draws a black circle centered at (216, 177) with radius 24.
; PLAN: r0=111(x), r1=62(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=216(x), r1=177(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (111, 62).
; PLAN: r0=111(x), r1=62(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 62
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (216, 177) with radius 24.
; PLAN: r0=216(x), r1=177(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 177
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
