; DESCRIPTION: Composite: Creates a yellow circular shape at (118, 60) with radius 12 then Renders a orange box of size 17x13 starting at (282, 8) then Renders a blue line between points (414, 130) and (433, 121).
; PLAN: r0=118(x), r1=60(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=8(y), r7=17(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x1), r11=130(y1), r12=433(x2), r13=121(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 60
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 8
LDI r7, 17
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 130
LDI r12, 433
LDI r13, 121
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
