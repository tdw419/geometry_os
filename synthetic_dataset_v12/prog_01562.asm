; DESCRIPTION: Composite: Draws a red circle centered at (96, 107) with radius 50 then Creates a white rectangular region at (475, 95) spanning 26 by 107 pixels then Places a red line segment connecting (374, 238) to (168, 207).
; PLAN: r0=96(x), r1=107(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x), r6=95(y), r7=26(width), r8=107(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x1), r11=238(y1), r12=168(x2), r13=207(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 107
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 95
LDI r7, 26
LDI r8, 107
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 238
LDI r12, 168
LDI r13, 207
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
