; DESCRIPTION: Composite: Draws a white rectangle at (79, 127) with width 26 and height 87 then Draws a purple line from (393, 59) to (178, 27) then Places a magenta circle of radius 25 at center (472, 101).
; PLAN: r0=79(x), r1=127(y), r2=26(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x1), r6=59(y1), r7=178(x2), r8=27(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=472(x), r11=101(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 79
LDI r1, 127
LDI r2, 26
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 59
LDI r7, 178
LDI r8, 27
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 101
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
