; DESCRIPTION: Composite: . Then Sets a single black pixel at (99, 162). Then Places a blue 37x18 rectangle at position (7, 67).
; PLAN: r0=99(x), r1=162(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=7(x), r1=67(y), r2=37(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (99, 162).
; PLAN: r0=99(x), r1=162(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 162
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a blue 37x18 rectangle at position (7, 67).
; PLAN: r0=7(x), r1=67(y), r2=37(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 67
LDI r2, 37
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
