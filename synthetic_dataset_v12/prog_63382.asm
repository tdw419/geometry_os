; DESCRIPTION: Composite: Renders a black line between points (431, 37) and (81, 186) then Creates a black rectangular region at (361, 3) spanning 101 by 64 pixels then Places a white circle of radius 66 at center (269, 167).
; PLAN: r0=431(x1), r1=37(y1), r2=81(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=3(y), r7=101(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=167(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 431
LDI r1, 37
LDI r2, 81
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 3
LDI r7, 101
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 167
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
