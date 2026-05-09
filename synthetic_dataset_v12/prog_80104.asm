; DESCRIPTION: Composite: Draws a white rectangle at (391, 75) with width 105 and height 82 then Places a magenta line segment connecting (341, 194) to (11, 37) then Draws a orange circle centered at (238, 71) with radius 36.
; PLAN: r0=391(x), r1=75(y), r2=105(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x1), r6=194(y1), r7=11(x2), r8=37(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=71(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 75
LDI r2, 105
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 194
LDI r7, 11
LDI r8, 37
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 71
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
