; DESCRIPTION: Composite: Creates a red rectangular region at (400, 128) spanning 42 by 28 pixels then Draws a purple circle centered at (156, 198) with radius 51 then Renders a red line between points (494, 68) and (367, 101).
; PLAN: r0=400(x), r1=128(y), r2=42(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=198(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=494(x1), r11=68(y1), r12=367(x2), r13=101(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 128
LDI r2, 42
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 198
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 494
LDI r11, 68
LDI r12, 367
LDI r13, 101
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
