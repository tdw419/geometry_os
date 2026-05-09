; DESCRIPTION: Composite: Places a red line segment connecting (236, 19) to (388, 139) then Creates a white circular shape at (429, 198) with radius 30 then Creates a purple rectangular region at (376, 116) spanning 93 by 115 pixels.
; PLAN: r0=236(x1), r1=19(y1), r2=388(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=198(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=116(y), r12=93(width), r13=115(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 19
LDI r2, 388
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 198
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 116
LDI r12, 93
LDI r13, 115
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
