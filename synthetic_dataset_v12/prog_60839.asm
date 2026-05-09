; DESCRIPTION: Composite: Creates a white rectangular region at (81, 8) spanning 19 by 112 pixels then Renders a orange line between points (284, 202) and (189, 37) then Draws a black circle centered at (66, 202) with radius 36.
; PLAN: r0=81(x), r1=8(y), r2=19(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x1), r6=202(y1), r7=189(x2), r8=37(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=66(x), r11=202(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 8
LDI r2, 19
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 202
LDI r7, 189
LDI r8, 37
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 202
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
