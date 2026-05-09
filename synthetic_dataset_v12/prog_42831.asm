; DESCRIPTION: Composite: Draws a purple rectangle at (173, 176) with width 90 and height 36 then Places a magenta dot at position (187, 9) then Draws a red circle centered at (174, 159) with radius 23.
; PLAN: r0=173(x), r1=176(y), r2=90(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=9(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=159(y), r12=23(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 176
LDI r2, 90
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 9
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 174
LDI r11, 159
LDI r12, 23
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
