; DESCRIPTION: Composite: Renders a purple disk with center (155, 219) and radius 24 then Places a black line segment connecting (424, 172) to (190, 114) then Renders a magenta box of size 65x25 starting at (227, 91).
; PLAN: r0=155(x), r1=219(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x1), r6=172(y1), r7=190(x2), r8=114(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=227(x), r11=91(y), r12=65(width), r13=25(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 219
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 172
LDI r7, 190
LDI r8, 114
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 91
LDI r12, 65
LDI r13, 25
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
