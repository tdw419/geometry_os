; DESCRIPTION: Composite: Draws a red line from (131, 134) to (323, 160) then Creates a red rectangular region at (46, 134) spanning 65 by 51 pixels then Draws a blue circle centered at (278, 210) with radius 25.
; PLAN: r0=131(x1), r1=134(y1), r2=323(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=134(y), r7=65(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x), r11=210(y), r12=25(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 134
LDI r2, 323
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 134
LDI r7, 65
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 210
LDI r12, 25
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
