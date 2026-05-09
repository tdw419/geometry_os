; DESCRIPTION: Composite: . Then Places a magenta dot at position (90, 235). Then Draws a green circle centered at (184, 114) with radius 60.
; PLAN: r0=90(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=184(x), r1=114(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (90, 235).
; PLAN: r0=90(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 235
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green circle centered at (184, 114) with radius 60.
; PLAN: r0=184(x), r1=114(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 114
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
