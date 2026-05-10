; DESCRIPTION: Composite: Renders a white box of size 117x71 starting at (86, 62) then Renders a orange line between points (133, 237) and (136, 69) then Creates a green circular shape at (386, 107) with radius 74.
; PLAN: r0=86(x), r1=62(y), r2=117(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x1), r6=237(y1), r7=136(x2), r8=69(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=107(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 62
LDI r2, 117
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 237
LDI r7, 136
LDI r8, 69
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 107
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
