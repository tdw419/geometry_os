; DESCRIPTION: Composite: Places a orange dot at position (396, 223) then Places a magenta 70x92 rectangle at position (29, 21) then Draws a blue circle centered at (438, 187) with radius 51.
; PLAN: r0=396(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=29(x), r6=21(y), r7=70(width), r8=92(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=187(y), r12=51(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 223
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 29
LDI r6, 21
LDI r7, 70
LDI r8, 92
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 187
LDI r12, 51
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
