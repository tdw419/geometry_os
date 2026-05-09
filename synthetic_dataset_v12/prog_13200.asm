; DESCRIPTION: Composite: Draws a green rectangle at (246, 54) with width 72 and height 73 then Places a green dot at position (37, 90) then Draws a red circle centered at (361, 78) with radius 78.
; PLAN: r0=246(x), r1=54(y), r2=72(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x), r6=90(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=361(x), r11=78(y), r12=78(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 54
LDI r2, 72
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 90
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 361
LDI r11, 78
LDI r12, 78
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
