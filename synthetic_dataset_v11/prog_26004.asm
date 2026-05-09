; DESCRIPTION: Composite: . Then Sets a single blue pixel at (59, 216). Then Places a magenta 81x57 rectangle at position (79, 79).
; PLAN: r0=59(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=79(x), r1=79(y), r2=81(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (59, 216).
; PLAN: r0=59(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 81x57 rectangle at position (79, 79).
; PLAN: r0=79(x), r1=79(y), r2=81(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 79
LDI r2, 81
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
