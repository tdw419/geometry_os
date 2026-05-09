; DESCRIPTION: Composite: . Then Draws a green circle centered at (134, 71) with radius 45. Then Places a magenta dot at position (31, 195).
; PLAN: r0=134(x), r1=71(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=31(x), r1=195(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green circle centered at (134, 71) with radius 45.
; PLAN: r0=134(x), r1=71(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 71
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (31, 195).
; PLAN: r0=31(x), r1=195(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 195
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
