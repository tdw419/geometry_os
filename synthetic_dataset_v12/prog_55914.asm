; DESCRIPTION: Composite: Draws a magenta circle centered at (174, 156) with radius 76 then Renders a purple box of size 22x56 starting at (87, 163) then Draws a red line from (47, 224) to (169, 217).
; PLAN: r0=174(x), r1=156(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=163(y), r7=22(width), r8=56(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x1), r11=224(y1), r12=169(x2), r13=217(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 156
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 163
LDI r7, 22
LDI r8, 56
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 224
LDI r12, 169
LDI r13, 217
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
