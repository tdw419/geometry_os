; DESCRIPTION: Composite: . Then Places a blue 35x110 rectangle at position (20, 32). Then Sets a single purple pixel at (156, 236).
; PLAN: r0=20(x), r1=32(y), r2=35(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=156(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 35x110 rectangle at position (20, 32).
; PLAN: r0=20(x), r1=32(y), r2=35(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 32
LDI r2, 35
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (156, 236).
; PLAN: r0=156(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
