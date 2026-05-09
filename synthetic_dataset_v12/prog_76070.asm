; DESCRIPTION: Composite: Renders a red disk with center (146, 166) and radius 72 then Places a orange line segment connecting (261, 58) to (217, 182) then Draws a yellow rectangle at (254, 174) with width 45 and height 14.
; PLAN: r0=146(x), r1=166(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x1), r6=58(y1), r7=217(x2), r8=182(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=254(x), r11=174(y), r12=45(width), r13=14(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 166
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 58
LDI r7, 217
LDI r8, 182
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 174
LDI r12, 45
LDI r13, 14
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
