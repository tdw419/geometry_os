; DESCRIPTION: Composite: Draws a blue rectangle at (448, 67) with width 38 and height 37 then Sets a single blue pixel at (494, 167).
; PLAN: r0=448(x), r1=67(y), r2=38(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=167(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 67
LDI r2, 38
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 167
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
