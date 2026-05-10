; DESCRIPTION: Composite: Sets a single white pixel at (386, 123) then Renders a red line between points (415, 165) and (245, 141) then Draws a orange rectangle at (166, 207) with width 11 and height 25.
; PLAN: r0=386(x), r1=123(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=415(x1), r6=165(y1), r7=245(x2), r8=141(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=166(x), r11=207(y), r12=11(width), r13=25(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 123
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 165
LDI r7, 245
LDI r8, 141
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 207
LDI r12, 11
LDI r13, 25
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
