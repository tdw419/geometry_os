; DESCRIPTION: Composite: . Then Places a purple dot at position (209, 151). Then Draws a green circle centered at (155, 102) with radius 68.
; PLAN: r0=209(x), r1=151(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=102(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (209, 151).
; PLAN: r0=209(x), r1=151(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 151
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green circle centered at (155, 102) with radius 68.
; PLAN: r0=155(x), r1=102(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 102
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
