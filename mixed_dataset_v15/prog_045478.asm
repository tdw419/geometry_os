; DESCRIPTION: Composite: Renders a cyan line between points (306, 255) and (311, 181) then Renders a red disk with center (204, 179) and radius 72 then Draws a yellow rectangle at (74, 144) with width 73 and height 13.
; PLAN: r0=306(x1), r1=255(y1), r2=311(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=179(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x), r11=144(y), r12=73(width), r13=13(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 255
LDI r2, 311
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 179
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 144
LDI r12, 73
LDI r13, 13
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
