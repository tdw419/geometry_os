; DESCRIPTION: Composite: Places a purple line segment connecting (425, 233) to (153, 155) then Renders a orange box of size 82x111 starting at (316, 56) then Draws a magenta circle centered at (46, 177) with radius 16.
; PLAN: r0=425(x1), r1=233(y1), r2=153(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=56(y), r7=82(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x), r11=177(y), r12=16(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 425
LDI r1, 233
LDI r2, 153
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 56
LDI r7, 82
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 177
LDI r12, 16
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
