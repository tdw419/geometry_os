; DESCRIPTION: Composite: . Then Places a magenta dot at position (87, 153). Then Draws a black circle centered at (147, 72) with radius 57.
; PLAN: r0=87(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=147(x), r1=72(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (87, 153).
; PLAN: r0=87(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 153
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (147, 72) with radius 57.
; PLAN: r0=147(x), r1=72(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 72
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
