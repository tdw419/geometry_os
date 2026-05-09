; DESCRIPTION: Composite: Sets a single white pixel at (287, 97) then Places a red line segment connecting (66, 16) to (496, 20) then Draws a magenta rectangle at (302, 171) with width 116 and height 82.
; PLAN: r0=287(x), r1=97(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=66(x1), r6=16(y1), r7=496(x2), r8=20(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=171(y), r12=116(width), r13=82(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 97
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 16
LDI r7, 496
LDI r8, 20
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 171
LDI r12, 116
LDI r13, 82
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
