; DESCRIPTION: Composite: Renders a green disk with center (309, 180) and radius 17 then Draws a red rectangle at (305, 70) with width 14 and height 71 then Places a magenta line segment connecting (464, 79) to (312, 158).
; PLAN: r0=309(x), r1=180(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=70(y), r7=14(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=464(x1), r11=79(y1), r12=312(x2), r13=158(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 180
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 70
LDI r7, 14
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 79
LDI r12, 312
LDI r13, 158
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
