; DESCRIPTION: Composite: Places a purple 42x35 rectangle at position (93, 88) then Renders a blue line between points (505, 188) and (122, 239) then Places a cyan circle of radius 63 at center (369, 156).
; PLAN: r0=93(x), r1=88(y), r2=42(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=505(x1), r6=188(y1), r7=122(x2), r8=239(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=156(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 88
LDI r2, 42
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 188
LDI r7, 122
LDI r8, 239
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 156
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
