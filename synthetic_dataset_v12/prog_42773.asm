; DESCRIPTION: Composite: Draws a green rectangle at (130, 63) with width 34 and height 98 then Sets a single blue pixel at (36, 104).
; PLAN: r0=130(x), r1=63(y), r2=34(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=104(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 63
LDI r2, 34
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 104
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
