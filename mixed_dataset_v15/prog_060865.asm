; DESCRIPTION: Composite: Draws a magenta rectangle at (144, 29) with width 19 and height 120 then Places a yellow circle of radius 75 at center (344, 171) then Draws a white line from (206, 121) to (21, 171).
; PLAN: r0=144(x), r1=29(y), r2=19(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=171(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=206(x1), r11=121(y1), r12=21(x2), r13=171(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 29
LDI r2, 19
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 171
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 206
LDI r11, 121
LDI r12, 21
LDI r13, 171
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
