; DESCRIPTION: Composite: Draws a red rectangle at (376, 178) with width 80 and height 45 then Places a black dot at position (427, 201) then Renders a white disk with center (281, 154) and radius 77.
; PLAN: r0=376(x), r1=178(y), r2=80(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=201(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=154(y), r12=77(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 178
LDI r2, 80
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 201
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 281
LDI r11, 154
LDI r12, 77
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
