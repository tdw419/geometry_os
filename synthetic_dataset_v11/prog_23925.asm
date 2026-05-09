; DESCRIPTION: Composite: . Then Sets a single red pixel at (13, 238). Then Places a cyan 110x33 rectangle at position (138, 71).
; PLAN: r0=13(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=138(x), r1=71(y), r2=110(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (13, 238).
; PLAN: r0=13(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 238
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan 110x33 rectangle at position (138, 71).
; PLAN: r0=138(x), r1=71(y), r2=110(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 71
LDI r2, 110
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
