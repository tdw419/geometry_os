; DESCRIPTION: Composite: Draws a yellow rectangle at (116, 77) with width 39 and height 119 then Renders a magenta line between points (10, 105) and (174, 201) then Renders a white disk with center (166, 153) and radius 72.
; PLAN: r0=116(x), r1=77(y), r2=39(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x1), r6=105(y1), r7=174(x2), r8=201(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=166(x), r11=153(y), r12=72(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 77
LDI r2, 39
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 105
LDI r7, 174
LDI r8, 201
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 153
LDI r12, 72
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
