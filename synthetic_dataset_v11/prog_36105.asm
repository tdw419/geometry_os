; DESCRIPTION: Composite: . Then Sets a single black pixel at (45, 126). Then Places a black 62x97 rectangle at position (65, 25).
; PLAN: r0=45(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=65(x), r1=25(y), r2=62(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (45, 126).
; PLAN: r0=45(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 126
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a black 62x97 rectangle at position (65, 25).
; PLAN: r0=65(x), r1=25(y), r2=62(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 25
LDI r2, 62
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
