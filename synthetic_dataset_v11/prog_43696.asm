; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (10, 153). Then Places a magenta 22x83 rectangle at position (126, 163).
; PLAN: r0=10(x), r1=153(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=126(x), r1=163(y), r2=22(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (10, 153).
; PLAN: r0=10(x), r1=153(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 153
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 22x83 rectangle at position (126, 163).
; PLAN: r0=126(x), r1=163(y), r2=22(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 163
LDI r2, 22
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
