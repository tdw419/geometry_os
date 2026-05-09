; DESCRIPTION: Composite: Draws a black circle centered at (376, 109) with radius 41 then Places a blue 19x54 rectangle at position (68, 52) then Places a orange dot at position (259, 84).
; PLAN: r0=376(x), r1=109(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=52(y), r7=19(width), r8=54(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x), r11=84(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 109
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 52
LDI r7, 19
LDI r8, 54
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 84
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
