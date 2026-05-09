; DESCRIPTION: Composite: . Then Draws a purple rectangle at (140, 117) with width 56 and height 107. Then Sets a single blue pixel at (196, 105).
; PLAN: r0=140(x), r1=117(y), r2=56(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=196(x), r1=105(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (140, 117) with width 56 and height 107.
; PLAN: r0=140(x), r1=117(y), r2=56(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 117
LDI r2, 56
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (196, 105).
; PLAN: r0=196(x), r1=105(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 105
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
