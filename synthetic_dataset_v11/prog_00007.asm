; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (170, 180). Then Places a blue 91x57 rectangle at position (49, 169).
; PLAN: r0=170(x), r1=180(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=49(x), r1=169(y), r2=91(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (170, 180).
; PLAN: r0=170(x), r1=180(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 180
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue 91x57 rectangle at position (49, 169).
; PLAN: r0=49(x), r1=169(y), r2=91(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 169
LDI r2, 91
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
