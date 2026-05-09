; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (6, 236). Then Places a magenta 100x64 rectangle at position (156, 188).
; PLAN: r0=6(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=156(x), r1=188(y), r2=100(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (6, 236).
; PLAN: r0=6(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 100x64 rectangle at position (156, 188).
; PLAN: r0=156(x), r1=188(y), r2=100(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 188
LDI r2, 100
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
