; DESCRIPTION: Composite: . Then Sets a single black pixel at (215, 96). Then Draws a magenta circle centered at (114, 68) with radius 34.
; PLAN: r0=215(x), r1=96(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=114(x), r1=68(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (215, 96).
; PLAN: r0=215(x), r1=96(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 96
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (114, 68) with radius 34.
; PLAN: r0=114(x), r1=68(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 68
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
