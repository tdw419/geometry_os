; DESCRIPTION: Composite: Places a yellow line segment connecting (328, 166) to (454, 239) then Places a red dot at position (353, 146) then Creates a red rectangular region at (93, 141) spanning 119 by 59 pixels.
; PLAN: r0=328(x1), r1=166(y1), r2=454(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=146(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=93(x), r11=141(y), r12=119(width), r13=59(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 166
LDI r2, 454
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 146
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 93
LDI r11, 141
LDI r12, 119
LDI r13, 59
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
