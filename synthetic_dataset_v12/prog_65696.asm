; DESCRIPTION: Composite: Draws a white rectangle at (248, 211) with width 39 and height 12 then Draws a blue line from (246, 102) to (71, 154) then Places a magenta circle of radius 24 at center (86, 106).
; PLAN: r0=248(x), r1=211(y), r2=39(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x1), r6=102(y1), r7=71(x2), r8=154(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=86(x), r11=106(y), r12=24(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 211
LDI r2, 39
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 102
LDI r7, 71
LDI r8, 154
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 106
LDI r12, 24
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
