; DESCRIPTION: Composite: Draws a magenta line from (329, 30) to (143, 213) then Renders a orange box of size 111x26 starting at (103, 155) then Renders a magenta disk with center (369, 18) and radius 14.
; PLAN: r0=329(x1), r1=30(y1), r2=143(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=155(y), r7=111(width), r8=26(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=369(x), r11=18(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 30
LDI r2, 143
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 155
LDI r7, 111
LDI r8, 26
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 18
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
