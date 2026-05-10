; DESCRIPTION: Composite: Draws a black rectangle at (253, 29) with width 50 and height 120 then Places a magenta line segment connecting (374, 177) to (101, 99) then Places a purple circle of radius 44 at center (327, 138).
; PLAN: r0=253(x), r1=29(y), r2=50(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x1), r6=177(y1), r7=101(x2), r8=99(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=138(y), r12=44(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 29
LDI r2, 50
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 177
LDI r7, 101
LDI r8, 99
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 138
LDI r12, 44
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
