; DESCRIPTION: Composite: . Then Draws a black rectangle at (78, 97) with width 80 and height 11. Then Places a purple dot at position (190, 158).
; PLAN: r0=78(x), r1=97(y), r2=80(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=190(x), r1=158(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (78, 97) with width 80 and height 11.
; PLAN: r0=78(x), r1=97(y), r2=80(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 97
LDI r2, 80
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (190, 158).
; PLAN: r0=190(x), r1=158(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 158
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
