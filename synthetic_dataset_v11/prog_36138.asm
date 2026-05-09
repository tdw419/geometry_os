; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (161, 141). Then Places a red 100x50 rectangle at position (104, 175).
; PLAN: r0=161(x), r1=141(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=104(x), r1=175(y), r2=100(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (161, 141).
; PLAN: r0=161(x), r1=141(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 141
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a red 100x50 rectangle at position (104, 175).
; PLAN: r0=104(x), r1=175(y), r2=100(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 175
LDI r2, 100
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
