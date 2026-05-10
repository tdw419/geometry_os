; DESCRIPTION: Composite: Creates a green circular shape at (105, 85) with radius 55 then Renders a blue line between points (494, 45) and (328, 236) then Creates a purple rectangular region at (391, 35) spanning 101 by 81 pixels.
; PLAN: r0=105(x), r1=85(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=45(y1), r7=328(x2), r8=236(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=35(y), r12=101(width), r13=81(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 85
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 45
LDI r7, 328
LDI r8, 236
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 35
LDI r12, 101
LDI r13, 81
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
