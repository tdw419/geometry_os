; DESCRIPTION: Composite: . Then Sets a single blue pixel at (192, 185). Then Draws a black rectangle at (87, 60) with width 73 and height 83.
; PLAN: r0=192(x), r1=185(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=87(x), r1=60(y), r2=73(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (192, 185).
; PLAN: r0=192(x), r1=185(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 185
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black rectangle at (87, 60) with width 73 and height 83.
; PLAN: r0=87(x), r1=60(y), r2=73(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 60
LDI r2, 73
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
