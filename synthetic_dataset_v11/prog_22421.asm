; DESCRIPTION: Composite: . Then Places a purple 30x78 rectangle at position (105, 159). Then Sets a single black pixel at (177, 35).
; PLAN: r0=105(x), r1=159(y), r2=30(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 30x78 rectangle at position (105, 159).
; PLAN: r0=105(x), r1=159(y), r2=30(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 159
LDI r2, 30
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (177, 35).
; PLAN: r0=177(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 35
LDI r2, 0x000000
PSET r0, r1, r2
HALT
