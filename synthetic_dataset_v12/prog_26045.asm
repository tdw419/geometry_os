; DESCRIPTION: Composite: Renders a orange line between points (28, 246) and (420, 192) then Draws a yellow rectangle at (341, 127) with width 11 and height 113 then Places a magenta circle of radius 11 at center (410, 115).
; PLAN: r0=28(x1), r1=246(y1), r2=420(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=127(y), r7=11(width), r8=113(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=115(y), r12=11(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 28
LDI r1, 246
LDI r2, 420
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 127
LDI r7, 11
LDI r8, 113
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 115
LDI r12, 11
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
