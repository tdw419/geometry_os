; DESCRIPTION: Composite: Renders a cyan line between points (435, 62) and (316, 181) then Creates a blue circular shape at (355, 127) with radius 71 then Draws a red rectangle at (16, 32) with width 113 and height 68.
; PLAN: r0=435(x1), r1=62(y1), r2=316(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=127(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=16(x), r11=32(y), r12=113(width), r13=68(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 435
LDI r1, 62
LDI r2, 316
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 127
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 16
LDI r11, 32
LDI r12, 113
LDI r13, 68
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
