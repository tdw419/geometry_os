; DESCRIPTION: Composite: . Then Places a black dot at position (36, 104). Then Draws a purple circle centered at (212, 141) with radius 42.
; PLAN: r0=36(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=212(x), r1=141(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (36, 104).
; PLAN: r0=36(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a purple circle centered at (212, 141) with radius 42.
; PLAN: r0=212(x), r1=141(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 141
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
