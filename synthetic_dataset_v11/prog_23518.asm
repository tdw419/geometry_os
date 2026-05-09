; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (180, 64) with radius 58. Then Places a purple dot at position (190, 195).
; PLAN: r0=180(x), r1=64(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=190(x), r1=195(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (180, 64) with radius 58.
; PLAN: r0=180(x), r1=64(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 64
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (190, 195).
; PLAN: r0=190(x), r1=195(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 195
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
