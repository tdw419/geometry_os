; DESCRIPTION: Composite: Draws a magenta line from (32, 218) to (304, 110) then Draws a green rectangle at (232, 146) with width 95 and height 71 then Places a purple circle of radius 29 at center (103, 93).
; PLAN: r0=32(x1), r1=218(y1), r2=304(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=146(y), r7=95(width), r8=71(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=103(x), r11=93(y), r12=29(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 32
LDI r1, 218
LDI r2, 304
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 146
LDI r7, 95
LDI r8, 71
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 93
LDI r12, 29
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
