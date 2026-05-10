; DESCRIPTION: Composite: Places a black dot at position (166, 83) then Draws a red rectangle at (183, 13) with width 117 and height 33 then Draws a white circle centered at (124, 142) with radius 42.
; PLAN: r0=166(x), r1=83(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=13(y), r7=117(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x), r11=142(y), r12=42(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 166
LDI r1, 83
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 183
LDI r6, 13
LDI r7, 117
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 142
LDI r12, 42
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
