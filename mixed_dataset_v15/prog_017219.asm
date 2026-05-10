; DESCRIPTION: Composite: Creates a black rectangular region at (215, 42) spanning 87 by 118 pixels then Draws a magenta circle centered at (404, 30) with radius 23 then Renders a red line between points (484, 17) and (190, 168).
; PLAN: r0=215(x), r1=42(y), r2=87(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=30(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=484(x1), r11=17(y1), r12=190(x2), r13=168(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 42
LDI r2, 87
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 30
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 484
LDI r11, 17
LDI r12, 190
LDI r13, 168
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
