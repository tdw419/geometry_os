; DESCRIPTION: Composite: . Then Places a purple 51x76 rectangle at position (26, 5). Then Sets a single blue pixel at (166, 69).
; PLAN: r0=26(x), r1=5(y), r2=51(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=166(x), r1=69(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 51x76 rectangle at position (26, 5).
; PLAN: r0=26(x), r1=5(y), r2=51(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 5
LDI r2, 51
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (166, 69).
; PLAN: r0=166(x), r1=69(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 69
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
