; DESCRIPTION: Composite: Sets a single orange pixel at (497, 142) then Places a magenta line segment connecting (475, 6) to (217, 158) then Draws a cyan rectangle at (385, 49) with width 111 and height 15.
; PLAN: r0=497(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=475(x1), r6=6(y1), r7=217(x2), r8=158(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=49(y), r12=111(width), r13=15(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 142
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 475
LDI r6, 6
LDI r7, 217
LDI r8, 158
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 49
LDI r12, 111
LDI r13, 15
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
