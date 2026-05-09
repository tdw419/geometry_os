; DESCRIPTION: Composite: . Then Places a magenta 11x15 rectangle at position (92, 52). Then Sets a single blue pixel at (162, 249).
; PLAN: r0=92(x), r1=52(y), r2=11(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=162(x), r1=249(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta 11x15 rectangle at position (92, 52).
; PLAN: r0=92(x), r1=52(y), r2=11(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 52
LDI r2, 11
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (162, 249).
; PLAN: r0=162(x), r1=249(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 249
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
