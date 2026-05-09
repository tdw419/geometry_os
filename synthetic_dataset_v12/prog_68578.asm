; DESCRIPTION: Composite: Draws a purple rectangle at (15, 45) with width 103 and height 51 then Draws a magenta line from (316, 101) to (440, 107) then Creates a green circular shape at (316, 118) with radius 79.
; PLAN: r0=15(x), r1=45(y), r2=103(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x1), r6=101(y1), r7=440(x2), r8=107(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=118(y), r12=79(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 45
LDI r2, 103
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 101
LDI r7, 440
LDI r8, 107
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 118
LDI r12, 79
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
