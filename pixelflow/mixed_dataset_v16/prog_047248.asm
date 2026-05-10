; DESCRIPTION: Composite: Renders a blue box of size 16x11 starting at (443, 181) then Draws a blue circle centered at (136, 174) with radius 12 then Renders a green line between points (177, 103) and (116, 194).
; PLAN: r0=443(x), r1=181(y), r2=16(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=174(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=177(x1), r11=103(y1), r12=116(x2), r13=194(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 181
LDI r2, 16
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 174
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 177
LDI r11, 103
LDI r12, 116
LDI r13, 194
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
