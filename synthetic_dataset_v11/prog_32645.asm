; DESCRIPTION: Composite: . Then Places a white dot at position (211, 22). Then Draws a magenta circle centered at (166, 81) with radius 66.
; PLAN: r0=211(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=166(x), r1=81(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (211, 22).
; PLAN: r0=211(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 22
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (166, 81) with radius 66.
; PLAN: r0=166(x), r1=81(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 81
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
