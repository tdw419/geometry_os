; DESCRIPTION: Composite: . Then Places a black dot at position (171, 54). Then Draws a magenta circle centered at (171, 191) with radius 25.
; PLAN: r0=171(x), r1=54(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=171(x), r1=191(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (171, 54).
; PLAN: r0=171(x), r1=54(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 54
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (171, 191) with radius 25.
; PLAN: r0=171(x), r1=191(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 191
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
