; DESCRIPTION: Composite: . Then Sets a single blue pixel at (146, 39). Then Places a purple 45x24 rectangle at position (179, 194).
; PLAN: r0=146(x), r1=39(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=179(x), r1=194(y), r2=45(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (146, 39).
; PLAN: r0=146(x), r1=39(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 39
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple 45x24 rectangle at position (179, 194).
; PLAN: r0=179(x), r1=194(y), r2=45(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 194
LDI r2, 45
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
