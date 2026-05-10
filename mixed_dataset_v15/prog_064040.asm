; DESCRIPTION: Composite: Draws a cyan rectangle at (483, 58) with width 17 and height 107 then Renders a black disk with center (257, 176) and radius 49.
; PLAN: r0=483(x), r1=58(y), r2=17(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=176(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 58
LDI r2, 17
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 176
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
