; DESCRIPTION: Composite: Draws a orange line from (18, 17) to (47, 132) then Draws a red rectangle at (43, 76) with width 102 and height 115 then Draws a red circle centered at (196, 125) with radius 48.
; PLAN: r0=18(x1), r1=17(y1), r2=47(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=76(y), r7=102(width), r8=115(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x), r11=125(y), r12=48(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 17
LDI r2, 47
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 76
LDI r7, 102
LDI r8, 115
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 125
LDI r12, 48
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
