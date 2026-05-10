; DESCRIPTION: Composite: Places a yellow line segment connecting (4, 7) to (162, 228) then Renders a purple disk with center (402, 134) and radius 53 then Renders a black box of size 111x54 starting at (143, 108).
; PLAN: r0=4(x1), r1=7(y1), r2=162(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=134(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=108(y), r12=111(width), r13=54(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 7
LDI r2, 162
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 134
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 108
LDI r12, 111
LDI r13, 54
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
