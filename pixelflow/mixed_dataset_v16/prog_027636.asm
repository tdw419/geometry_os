; DESCRIPTION: Composite: Renders a red line between points (150, 141) and (315, 242) then Places a black circle of radius 38 at center (137, 114) then Creates a white rectangular region at (146, 19) spanning 16 by 58 pixels.
; PLAN: r0=150(x1), r1=141(y1), r2=315(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=114(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x), r11=19(y), r12=16(width), r13=58(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 141
LDI r2, 315
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 114
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 19
LDI r12, 16
LDI r13, 58
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
