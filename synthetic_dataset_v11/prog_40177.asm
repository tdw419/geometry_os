; DESCRIPTION: Composite: . Then Draws a purple rectangle at (126, 30) with width 52 and height 59. Then Places a purple dot at position (86, 155).
; PLAN: r0=126(x), r1=30(y), r2=52(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=86(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (126, 30) with width 52 and height 59.
; PLAN: r0=126(x), r1=30(y), r2=52(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 30
LDI r2, 52
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (86, 155).
; PLAN: r0=86(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 155
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
