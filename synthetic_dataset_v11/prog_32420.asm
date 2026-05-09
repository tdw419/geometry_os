; DESCRIPTION: Composite: . Then Sets a single red pixel at (3, 173). Then Places a purple 90x53 rectangle at position (155, 78).
; PLAN: r0=3(x), r1=173(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=78(y), r2=90(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (3, 173).
; PLAN: r0=3(x), r1=173(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 173
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a purple 90x53 rectangle at position (155, 78).
; PLAN: r0=155(x), r1=78(y), r2=90(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 78
LDI r2, 90
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
