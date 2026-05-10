; DESCRIPTION: Composite: Draws a blue rectangle at (118, 92) with width 66 and height 36 then Sets a single green pixel at (422, 170).
; PLAN: r0=118(x), r1=92(y), r2=66(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=170(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 92
LDI r2, 66
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 170
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
