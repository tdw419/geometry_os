; DESCRIPTION: Composite: Sets a single white pixel at (408, 130) then Draws a green rectangle at (276, 157) with width 114 and height 69 then Renders a blue line between points (421, 250) and (286, 3).
; PLAN: r0=408(x), r1=130(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=157(y), r7=114(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x1), r11=250(y1), r12=286(x2), r13=3(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 130
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 276
LDI r6, 157
LDI r7, 114
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 250
LDI r12, 286
LDI r13, 3
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
