; DESCRIPTION: Composite: Draws a yellow rectangle at (310, 163) with width 107 and height 91 then Creates a blue circular shape at (239, 105) with radius 79 then Renders a yellow line between points (34, 243) and (126, 192).
; PLAN: r0=310(x), r1=163(y), r2=107(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x), r6=105(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=34(x1), r11=243(y1), r12=126(x2), r13=192(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 163
LDI r2, 107
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 105
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 34
LDI r11, 243
LDI r12, 126
LDI r13, 192
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
