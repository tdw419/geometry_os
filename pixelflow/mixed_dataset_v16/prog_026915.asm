; DESCRIPTION: Composite: Places a white 77x42 rectangle at position (353, 78) then Places a orange circle of radius 41 at center (223, 207) then Sets a single black pixel at (151, 74).
; PLAN: r0=353(x), r1=78(y), r2=77(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=207(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=151(x), r11=74(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 78
LDI r2, 77
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 207
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 151
LDI r11, 74
LDI r12, 0x000000
PSET r10, r11, r12
HALT
