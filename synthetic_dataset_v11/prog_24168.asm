; DESCRIPTION: Composite: . Then Places a red dot at position (128, 69). Then Draws a blue circle centered at (115, 92) with radius 63.
; PLAN: r0=128(x), r1=69(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=115(x), r1=92(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (128, 69).
; PLAN: r0=128(x), r1=69(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 69
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (115, 92) with radius 63.
; PLAN: r0=115(x), r1=92(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 92
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
