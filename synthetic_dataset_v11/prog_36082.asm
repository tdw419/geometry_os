; DESCRIPTION: Composite: . Then Sets a single black pixel at (131, 107). Then Places a magenta 106x81 rectangle at position (1, 131).
; PLAN: r0=131(x), r1=107(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=1(x), r1=131(y), r2=106(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (131, 107).
; PLAN: r0=131(x), r1=107(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 107
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 106x81 rectangle at position (1, 131).
; PLAN: r0=1(x), r1=131(y), r2=106(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 131
LDI r2, 106
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
