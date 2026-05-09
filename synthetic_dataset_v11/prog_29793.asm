; DESCRIPTION: Composite: . Then Places a magenta 65x46 rectangle at position (140, 21). Then Sets a single blue pixel at (53, 195).
; PLAN: r0=140(x), r1=21(y), r2=65(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=53(x), r1=195(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta 65x46 rectangle at position (140, 21).
; PLAN: r0=140(x), r1=21(y), r2=65(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 21
LDI r2, 65
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (53, 195).
; PLAN: r0=53(x), r1=195(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 195
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
