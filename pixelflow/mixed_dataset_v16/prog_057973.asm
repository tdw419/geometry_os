; DESCRIPTION: Composite: Renders a orange disk with center (256, 147) and radius 51 then Renders a black line between points (74, 86) and (139, 158) then Creates a cyan rectangular region at (135, 69) spanning 109 by 109 pixels.
; PLAN: r0=256(x), r1=147(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x1), r6=86(y1), r7=139(x2), r8=158(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=135(x), r11=69(y), r12=109(width), r13=109(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 147
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 86
LDI r7, 139
LDI r8, 158
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 69
LDI r12, 109
LDI r13, 109
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
