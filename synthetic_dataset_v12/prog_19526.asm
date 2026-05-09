; DESCRIPTION: Composite: Renders a purple box of size 17x90 starting at (355, 165) then Places a yellow circle of radius 32 at center (99, 182) then Renders a orange line between points (192, 81) and (330, 74).
; PLAN: r0=355(x), r1=165(y), r2=17(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=182(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=192(x1), r11=81(y1), r12=330(x2), r13=74(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 165
LDI r2, 17
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 182
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 192
LDI r11, 81
LDI r12, 330
LDI r13, 74
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
