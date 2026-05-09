; DESCRIPTION: Composite: Draws a red line from (66, 115) to (265, 140) then Places a black circle of radius 52 at center (337, 178) then Places a purple 116x11 rectangle at position (334, 49).
; PLAN: r0=66(x1), r1=115(y1), r2=265(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=178(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x), r11=49(y), r12=116(width), r13=11(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 115
LDI r2, 265
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 178
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 49
LDI r12, 116
LDI r13, 11
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
