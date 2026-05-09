; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (114, 59). Then Places a magenta 103x85 rectangle at position (9, 170).
; PLAN: r0=114(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=9(x), r1=170(y), r2=103(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (114, 59).
; PLAN: r0=114(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 103x85 rectangle at position (9, 170).
; PLAN: r0=9(x), r1=170(y), r2=103(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 170
LDI r2, 103
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
