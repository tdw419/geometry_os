; DESCRIPTION: Composite: . Then Places a magenta 115x11 rectangle at position (136, 14). Then Sets a single yellow pixel at (100, 204).
; PLAN: r0=136(x), r1=14(y), r2=115(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=100(x), r1=204(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta 115x11 rectangle at position (136, 14).
; PLAN: r0=136(x), r1=14(y), r2=115(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 14
LDI r2, 115
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (100, 204).
; PLAN: r0=100(x), r1=204(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 204
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
