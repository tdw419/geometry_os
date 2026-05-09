; DESCRIPTION: Composite: Creates a red circular shape at (121, 177) with radius 75 then Draws a purple rectangle at (143, 125) with width 58 and height 107 then Draws a blue line from (145, 68) to (510, 107).
; PLAN: r0=121(x), r1=177(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=125(y), r7=58(width), r8=107(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=145(x1), r11=68(y1), r12=510(x2), r13=107(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 177
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 125
LDI r7, 58
LDI r8, 107
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 68
LDI r12, 510
LDI r13, 107
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
