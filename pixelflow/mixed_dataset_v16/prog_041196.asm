; DESCRIPTION: Composite: Draws a purple rectangle at (170, 158) with width 108 and height 74 then Draws a purple line from (42, 88) to (474, 93) then Draws a magenta circle centered at (215, 127) with radius 46.
; PLAN: r0=170(x), r1=158(y), r2=108(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x1), r6=88(y1), r7=474(x2), r8=93(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=127(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 170
LDI r1, 158
LDI r2, 108
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 88
LDI r7, 474
LDI r8, 93
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 127
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
