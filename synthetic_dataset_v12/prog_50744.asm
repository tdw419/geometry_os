; DESCRIPTION: Composite: Renders a yellow disk with center (273, 104) and radius 79 then Renders a cyan line between points (165, 223) and (143, 140) then Draws a magenta rectangle at (282, 119) with width 38 and height 69.
; PLAN: r0=273(x), r1=104(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x1), r6=223(y1), r7=143(x2), r8=140(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=282(x), r11=119(y), r12=38(width), r13=69(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 104
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 223
LDI r7, 143
LDI r8, 140
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 119
LDI r12, 38
LDI r13, 69
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
