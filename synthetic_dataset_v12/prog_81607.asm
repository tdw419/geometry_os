; DESCRIPTION: Composite: Draws a blue line from (494, 89) to (14, 238) then Creates a yellow rectangular region at (316, 66) spanning 35 by 75 pixels then Renders a magenta disk with center (410, 73) and radius 25.
; PLAN: r0=494(x1), r1=89(y1), r2=14(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=66(y), r7=35(width), r8=75(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=73(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 494
LDI r1, 89
LDI r2, 14
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 66
LDI r7, 35
LDI r8, 75
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 73
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
