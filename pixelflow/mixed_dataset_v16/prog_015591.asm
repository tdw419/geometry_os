; DESCRIPTION: Composite: Places a white dot at position (258, 72) then Creates a purple rectangular region at (345, 84) spanning 29 by 87 pixels then Draws a blue circle centered at (112, 91) with radius 72.
; PLAN: r0=258(x), r1=72(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=84(y), r7=29(width), r8=87(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=112(x), r11=91(y), r12=72(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 72
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 84
LDI r7, 29
LDI r8, 87
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 91
LDI r12, 72
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
