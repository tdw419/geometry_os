; DESCRIPTION: Composite: . Then Places a cyan 22x37 rectangle at position (199, 126). Then Sets a single black pixel at (67, 4).
; PLAN: r0=199(x), r1=126(y), r2=22(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=67(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 22x37 rectangle at position (199, 126).
; PLAN: r0=199(x), r1=126(y), r2=22(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 126
LDI r2, 22
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (67, 4).
; PLAN: r0=67(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 4
LDI r2, 0x000000
PSET r0, r1, r2
HALT
