; DESCRIPTION: Composite: . Then Places a magenta 35x119 rectangle at position (131, 53). Then Sets a single blue pixel at (197, 70).
; PLAN: r0=131(x), r1=53(y), r2=35(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=197(x), r1=70(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta 35x119 rectangle at position (131, 53).
; PLAN: r0=131(x), r1=53(y), r2=35(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 53
LDI r2, 35
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (197, 70).
; PLAN: r0=197(x), r1=70(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 70
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
