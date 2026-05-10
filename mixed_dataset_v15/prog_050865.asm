; DESCRIPTION: Composite: Draws a purple line from (292, 16) to (26, 246) then Renders a purple disk with center (414, 54) and radius 35 then Renders a white box of size 95x15 starting at (276, 53).
; PLAN: r0=292(x1), r1=16(y1), r2=26(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=54(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=276(x), r11=53(y), r12=95(width), r13=15(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 16
LDI r2, 26
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 54
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 276
LDI r11, 53
LDI r12, 95
LDI r13, 15
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
