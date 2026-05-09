; DESCRIPTION: Composite: Draws a yellow rectangle at (212, 229) with width 25 and height 17 then Renders a green line between points (437, 165) and (481, 132) then Draws a black circle centered at (113, 107) with radius 38.
; PLAN: r0=212(x), r1=229(y), r2=25(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x1), r6=165(y1), r7=481(x2), r8=132(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=107(y), r12=38(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 229
LDI r2, 25
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 165
LDI r7, 481
LDI r8, 132
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 107
LDI r12, 38
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
