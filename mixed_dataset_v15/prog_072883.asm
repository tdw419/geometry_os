; DESCRIPTION: Composite: Draws a magenta line from (296, 53) to (278, 241) then Places a orange dot at position (428, 199) then Draws a purple rectangle at (190, 139) with width 96 and height 10.
; PLAN: r0=296(x1), r1=53(y1), r2=278(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=199(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=139(y), r12=96(width), r13=10(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 53
LDI r2, 278
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 199
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 190
LDI r11, 139
LDI r12, 96
LDI r13, 10
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
