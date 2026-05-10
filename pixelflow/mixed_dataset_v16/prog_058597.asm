; DESCRIPTION: Composite: Draws a red line from (488, 145) to (452, 165) then Places a black dot at position (175, 72) then Draws a magenta rectangle at (435, 79) with width 24 and height 118.
; PLAN: r0=488(x1), r1=145(y1), r2=452(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=72(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=435(x), r11=79(y), r12=24(width), r13=118(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 145
LDI r2, 452
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 72
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 435
LDI r11, 79
LDI r12, 24
LDI r13, 118
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
