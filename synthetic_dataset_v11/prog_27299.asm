; DESCRIPTION: Composite: . Then Sets a single purple pixel at (200, 88). Then Places a cyan 83x95 rectangle at position (89, 3).
; PLAN: r0=200(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=89(x), r1=3(y), r2=83(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (200, 88).
; PLAN: r0=200(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 88
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan 83x95 rectangle at position (89, 3).
; PLAN: r0=89(x), r1=3(y), r2=83(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 3
LDI r2, 83
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
