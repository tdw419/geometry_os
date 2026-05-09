; DESCRIPTION: Composite: Draws a orange circle centered at (97, 212) with radius 44 then Places a red 105x93 rectangle at position (360, 45) then Sets a single black pixel at (119, 59).
; PLAN: r0=97(x), r1=212(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=45(y), r7=105(width), r8=93(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=119(x), r11=59(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 212
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 45
LDI r7, 105
LDI r8, 93
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 59
LDI r12, 0x000000
PSET r10, r11, r12
HALT
