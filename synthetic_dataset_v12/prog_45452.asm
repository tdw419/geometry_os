; DESCRIPTION: Composite: Places a blue circle of radius 44 at center (231, 86) then Draws a black rectangle at (494, 76) with width 15 and height 11 then Places a cyan dot at position (463, 201).
; PLAN: r0=231(x), r1=86(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x), r6=76(y), r7=15(width), r8=11(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x), r11=201(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 86
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 76
LDI r7, 15
LDI r8, 11
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 201
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
