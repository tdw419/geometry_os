; DESCRIPTION: Composite: Draws a green rectangle at (110, 108) with width 26 and height 69 then Sets a single cyan pixel at (408, 251) then Draws a black circle centered at (348, 49) with radius 27.
; PLAN: r0=110(x), r1=108(y), r2=26(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=251(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=49(y), r12=27(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 108
LDI r2, 26
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 251
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 49
LDI r12, 27
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
