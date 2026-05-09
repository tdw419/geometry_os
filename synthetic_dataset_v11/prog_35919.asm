; DESCRIPTION: Composite: . Then Places a cyan 83x30 rectangle at position (90, 33). Then Sets a single yellow pixel at (94, 183).
; PLAN: r0=90(x), r1=33(y), r2=83(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=94(x), r1=183(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 83x30 rectangle at position (90, 33).
; PLAN: r0=90(x), r1=33(y), r2=83(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 33
LDI r2, 83
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (94, 183).
; PLAN: r0=94(x), r1=183(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 183
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
