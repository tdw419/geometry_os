; DESCRIPTION: Composite: Draws a orange rectangle at (309, 13) with width 79 and height 101 then Places a purple line segment connecting (230, 203) to (353, 225).
; PLAN: r0=309(x), r1=13(y), r2=79(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=203(y1), r7=353(x2), r8=225(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 13
LDI r2, 79
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 203
LDI r7, 353
LDI r8, 225
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
