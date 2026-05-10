; DESCRIPTION: Composite: Places a cyan dot at position (76, 159) then Places a purple line segment connecting (71, 18) to (312, 99) then Draws a magenta rectangle at (162, 49) with width 20 and height 19.
; PLAN: r0=76(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=71(x1), r6=18(y1), r7=312(x2), r8=99(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=162(x), r11=49(y), r12=20(width), r13=19(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 159
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 71
LDI r6, 18
LDI r7, 312
LDI r8, 99
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 49
LDI r12, 20
LDI r13, 19
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
