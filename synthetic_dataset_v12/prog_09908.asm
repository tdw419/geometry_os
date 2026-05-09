; DESCRIPTION: Composite: Places a white circle of radius 39 at center (257, 154) then Draws a red rectangle at (433, 17) with width 79 and height 26 then Places a black dot at position (161, 41).
; PLAN: r0=257(x), r1=154(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=17(y), r7=79(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x), r11=41(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 154
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 17
LDI r7, 79
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 41
LDI r12, 0x000000
PSET r10, r11, r12
HALT
