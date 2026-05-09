; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (2, 151). Then Places a purple 57x23 rectangle at position (25, 153).
; PLAN: r0=2(x), r1=151(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=25(x), r1=153(y), r2=57(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (2, 151).
; PLAN: r0=2(x), r1=151(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 151
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a purple 57x23 rectangle at position (25, 153).
; PLAN: r0=25(x), r1=153(y), r2=57(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 153
LDI r2, 57
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
