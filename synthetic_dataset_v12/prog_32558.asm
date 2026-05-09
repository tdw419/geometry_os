; DESCRIPTION: Composite: Renders a purple box of size 36x36 starting at (107, 98) then Places a yellow circle of radius 69 at center (192, 137) then Places a red line segment connecting (279, 1) to (490, 6).
; PLAN: r0=107(x), r1=98(y), r2=36(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=137(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x1), r11=1(y1), r12=490(x2), r13=6(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 98
LDI r2, 36
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 137
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 1
LDI r12, 490
LDI r13, 6
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
