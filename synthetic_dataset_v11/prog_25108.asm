; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (23, 180). Then Places a magenta 118x107 rectangle at position (107, 5).
; PLAN: r0=23(x), r1=180(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=107(x), r1=5(y), r2=118(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (23, 180).
; PLAN: r0=23(x), r1=180(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 180
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 118x107 rectangle at position (107, 5).
; PLAN: r0=107(x), r1=5(y), r2=118(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 5
LDI r2, 118
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
