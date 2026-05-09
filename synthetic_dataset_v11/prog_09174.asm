; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (235, 21) with radius 11. Then Places a cyan dot at position (53, 75).
; PLAN: r0=235(x), r1=21(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=53(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (235, 21) with radius 11.
; PLAN: r0=235(x), r1=21(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 21
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (53, 75).
; PLAN: r0=53(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 75
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
