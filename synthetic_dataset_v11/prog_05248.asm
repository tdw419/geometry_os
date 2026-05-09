; DESCRIPTION: Composite: . Then Places a orange 61x114 rectangle at position (118, 43). Then Sets a single magenta pixel at (66, 29).
; PLAN: r0=118(x), r1=43(y), r2=61(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=66(x), r1=29(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange 61x114 rectangle at position (118, 43).
; PLAN: r0=118(x), r1=43(y), r2=61(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 43
LDI r2, 61
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (66, 29).
; PLAN: r0=66(x), r1=29(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 29
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
