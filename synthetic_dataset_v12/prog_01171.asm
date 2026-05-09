; DESCRIPTION: Composite: Draws a cyan circle centered at (485, 139) with radius 17 then Renders a purple box of size 58x96 starting at (162, 43) then Places a yellow line segment connecting (211, 132) to (461, 67).
; PLAN: r0=485(x), r1=139(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=43(y), r7=58(width), r8=96(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=211(x1), r11=132(y1), r12=461(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 485
LDI r1, 139
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 43
LDI r7, 58
LDI r8, 96
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 132
LDI r12, 461
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
