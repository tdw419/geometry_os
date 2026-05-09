; DESCRIPTION: Composite: Draws a black circle centered at (333, 59) with radius 58 then Places a black 41x107 rectangle at position (49, 9) then Sets a single purple pixel at (249, 98).
; PLAN: r0=333(x), r1=59(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=9(y), r7=41(width), r8=107(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=249(x), r11=98(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 333
LDI r1, 59
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 9
LDI r7, 41
LDI r8, 107
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 98
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
