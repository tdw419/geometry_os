; DESCRIPTION: Composite: Draws a orange line from (304, 133) to (6, 27) then Draws a purple rectangle at (238, 7) with width 39 and height 100 then Renders a purple disk with center (174, 165) and radius 55.
; PLAN: r0=304(x1), r1=133(y1), r2=6(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=7(y), r7=39(width), r8=100(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x), r11=165(y), r12=55(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 133
LDI r2, 6
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 7
LDI r7, 39
LDI r8, 100
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 165
LDI r12, 55
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
