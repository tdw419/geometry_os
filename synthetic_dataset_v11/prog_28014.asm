; DESCRIPTION: Composite: . Then Draws a green circle centered at (100, 197) with radius 16. Then Places a magenta dot at position (145, 163).
; PLAN: r0=100(x), r1=197(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=145(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green circle centered at (100, 197) with radius 16.
; PLAN: r0=100(x), r1=197(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 197
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (145, 163).
; PLAN: r0=145(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
