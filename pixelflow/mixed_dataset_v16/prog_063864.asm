; DESCRIPTION: Composite: Renders a magenta disk with center (252, 103) and radius 61 then Draws a blue line from (390, 33) to (500, 166) then Draws a magenta rectangle at (119, 153) with width 32 and height 17.
; PLAN: r0=252(x), r1=103(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x1), r6=33(y1), r7=500(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=119(x), r11=153(y), r12=32(width), r13=17(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 103
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 33
LDI r7, 500
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 153
LDI r12, 32
LDI r13, 17
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
