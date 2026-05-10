; DESCRIPTION: Composite: Places a purple dot at position (121, 125) then Places a black line segment connecting (146, 83) to (176, 3) then Draws a magenta rectangle at (188, 49) with width 51 and height 10.
; PLAN: r0=121(x), r1=125(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=146(x1), r6=83(y1), r7=176(x2), r8=3(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=49(y), r12=51(width), r13=10(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 125
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 83
LDI r7, 176
LDI r8, 3
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 49
LDI r12, 51
LDI r13, 10
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
