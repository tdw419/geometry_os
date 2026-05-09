; DESCRIPTION: Composite: Draws a white rectangle at (284, 191) with width 119 and height 26 then Sets a single blue pixel at (25, 176).
; PLAN: r0=284(x), r1=191(y), r2=119(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x), r6=176(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 284
LDI r1, 191
LDI r2, 119
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 176
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
