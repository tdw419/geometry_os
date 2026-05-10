; DESCRIPTION: Composite: Draws a purple rectangle at (257, 40) with width 67 and height 36 then Places a yellow circle of radius 17 at center (127, 52) then Places a black line segment connecting (195, 87) to (69, 43).
; PLAN: r0=257(x), r1=40(y), r2=67(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=52(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x1), r11=87(y1), r12=69(x2), r13=43(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 40
LDI r2, 67
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 52
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 87
LDI r12, 69
LDI r13, 43
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
