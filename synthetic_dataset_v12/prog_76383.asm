; DESCRIPTION: Composite: Draws a magenta rectangle at (125, 55) with width 67 and height 15 then Renders a cyan disk with center (300, 90) and radius 69 then Draws a yellow line from (202, 85) to (328, 42).
; PLAN: r0=125(x), r1=55(y), r2=67(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=90(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=202(x1), r11=85(y1), r12=328(x2), r13=42(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 55
LDI r2, 67
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 90
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 202
LDI r11, 85
LDI r12, 328
LDI r13, 42
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
