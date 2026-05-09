; DESCRIPTION: Composite: . Then Places a blue 90x61 rectangle at position (157, 93). Then Sets a single purple pixel at (71, 86).
; PLAN: r0=157(x), r1=93(y), r2=90(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=71(x), r1=86(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 90x61 rectangle at position (157, 93).
; PLAN: r0=157(x), r1=93(y), r2=90(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 93
LDI r2, 90
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (71, 86).
; PLAN: r0=71(x), r1=86(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 86
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
