; DESCRIPTION: Composite: Draws a magenta circle centered at (309, 170) with radius 28 then Draws a green line from (177, 169) to (440, 205) then Draws a yellow rectangle at (95, 136) with width 103 and height 52.
; PLAN: r0=309(x), r1=170(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x1), r6=169(y1), r7=440(x2), r8=205(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=95(x), r11=136(y), r12=103(width), r13=52(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 170
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 169
LDI r7, 440
LDI r8, 205
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 136
LDI r12, 103
LDI r13, 52
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
