; DESCRIPTION: Composite: Draws a green rectangle at (248, 126) with width 120 and height 93 then Draws a white circle centered at (418, 170) with radius 58 then Places a black dot at position (388, 2).
; PLAN: r0=248(x), r1=126(y), r2=120(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=170(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x), r11=2(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 126
LDI r2, 120
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 170
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 2
LDI r12, 0x000000
PSET r10, r11, r12
HALT
