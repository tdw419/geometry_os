; DESCRIPTION: Composite: . Then Places a red 80x118 rectangle at position (26, 89). Then Sets a single cyan pixel at (238, 128).
; PLAN: r0=26(x), r1=89(y), r2=80(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=238(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 80x118 rectangle at position (26, 89).
; PLAN: r0=26(x), r1=89(y), r2=80(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 89
LDI r2, 80
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (238, 128).
; PLAN: r0=238(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 128
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
