; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (102, 248). Then Draws a purple circle centered at (86, 81) with radius 32.
; PLAN: r0=102(x), r1=248(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=86(x), r1=81(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (102, 248).
; PLAN: r0=102(x), r1=248(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 248
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple circle centered at (86, 81) with radius 32.
; PLAN: r0=86(x), r1=81(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 81
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
