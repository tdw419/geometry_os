; DESCRIPTION: Composite: Sets a single yellow pixel at (119, 72) then Places a white line segment connecting (163, 117) to (357, 138) then Creates a yellow rectangular region at (303, 182) spanning 113 by 67 pixels.
; PLAN: r0=119(x), r1=72(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=163(x1), r6=117(y1), r7=357(x2), r8=138(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=182(y), r12=113(width), r13=67(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 72
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 163
LDI r6, 117
LDI r7, 357
LDI r8, 138
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 182
LDI r12, 113
LDI r13, 67
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
