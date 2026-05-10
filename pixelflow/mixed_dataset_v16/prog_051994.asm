; DESCRIPTION: Composite: Places a orange 36x85 rectangle at position (422, 106) then Draws a yellow line from (507, 100) to (432, 195) then Renders a magenta disk with center (170, 99) and radius 68.
; PLAN: r0=422(x), r1=106(y), r2=36(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x1), r6=100(y1), r7=432(x2), r8=195(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=170(x), r11=99(y), r12=68(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 422
LDI r1, 106
LDI r2, 36
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 100
LDI r7, 432
LDI r8, 195
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 99
LDI r12, 68
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
