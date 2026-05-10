; DESCRIPTION: Composite: Renders a red line between points (198, 170) and (79, 122) then Draws a blue rectangle at (95, 204) with width 65 and height 32 then Draws a magenta circle centered at (409, 202) with radius 46.
; PLAN: r0=198(x1), r1=170(y1), r2=79(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=204(y), r7=65(width), r8=32(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x), r11=202(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 198
LDI r1, 170
LDI r2, 79
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 204
LDI r7, 65
LDI r8, 32
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 202
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
