; DESCRIPTION: Composite: . Then Places a cyan 54x15 rectangle at position (113, 145). Then Sets a single yellow pixel at (197, 100).
; PLAN: r0=113(x), r1=145(y), r2=54(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=197(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 54x15 rectangle at position (113, 145).
; PLAN: r0=113(x), r1=145(y), r2=54(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 145
LDI r2, 54
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (197, 100).
; PLAN: r0=197(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
