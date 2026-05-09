; DESCRIPTION: Composite: Draws a magenta line from (391, 137) to (41, 54) then Renders a yellow disk with center (322, 194) and radius 59 then Draws a green rectangle at (249, 114) with width 29 and height 118.
; PLAN: r0=391(x1), r1=137(y1), r2=41(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=194(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=249(x), r11=114(y), r12=29(width), r13=118(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 137
LDI r2, 41
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 194
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 249
LDI r11, 114
LDI r12, 29
LDI r13, 118
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
