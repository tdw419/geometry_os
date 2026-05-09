; DESCRIPTION: Composite: . Then Sets a single purple pixel at (150, 119). Then Places a blue 37x69 rectangle at position (56, 36).
; PLAN: r0=150(x), r1=119(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=56(x), r1=36(y), r2=37(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (150, 119).
; PLAN: r0=150(x), r1=119(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 119
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue 37x69 rectangle at position (56, 36).
; PLAN: r0=56(x), r1=36(y), r2=37(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 36
LDI r2, 37
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
