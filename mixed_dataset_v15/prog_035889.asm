; DESCRIPTION: Composite: Places a white dot at position (274, 124) then Creates a magenta rectangular region at (67, 109) spanning 88 by 69 pixels then Places a magenta line segment connecting (339, 190) to (133, 79).
; PLAN: r0=274(x), r1=124(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=109(y), r7=88(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=339(x1), r11=190(y1), r12=133(x2), r13=79(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 124
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 109
LDI r7, 88
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 190
LDI r12, 133
LDI r13, 79
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
