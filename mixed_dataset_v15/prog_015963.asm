; DESCRIPTION: Composite: Draws a green rectangle at (63, 163) with width 71 and height 48 then Creates a black circular shape at (174, 123) with radius 33 then Draws a yellow line from (83, 41) to (377, 177).
; PLAN: r0=63(x), r1=163(y), r2=71(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=123(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=83(x1), r11=41(y1), r12=377(x2), r13=177(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 163
LDI r2, 71
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 123
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 83
LDI r11, 41
LDI r12, 377
LDI r13, 177
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
