; DESCRIPTION: Composite: . Then Places a magenta 53x79 rectangle at position (53, 24). Then Sets a single red pixel at (106, 14).
; PLAN: r0=53(x), r1=24(y), r2=53(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=106(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta 53x79 rectangle at position (53, 24).
; PLAN: r0=53(x), r1=24(y), r2=53(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 24
LDI r2, 53
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (106, 14).
; PLAN: r0=106(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 14
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
