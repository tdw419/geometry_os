; DESCRIPTION: Composite: . Then Places a yellow 105x74 rectangle at position (131, 67). Then Sets a single purple pixel at (109, 219).
; PLAN: r0=131(x), r1=67(y), r2=105(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=109(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 105x74 rectangle at position (131, 67).
; PLAN: r0=131(x), r1=67(y), r2=105(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 67
LDI r2, 105
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (109, 219).
; PLAN: r0=109(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 219
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
