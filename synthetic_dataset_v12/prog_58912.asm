; DESCRIPTION: Composite: Places a cyan dot at position (488, 142) then Creates a blue rectangular region at (179, 81) spanning 67 by 14 pixels then Places a magenta line segment connecting (133, 72) to (497, 194).
; PLAN: r0=488(x), r1=142(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=81(y), r7=67(width), r8=14(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x1), r11=72(y1), r12=497(x2), r13=194(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 142
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 179
LDI r6, 81
LDI r7, 67
LDI r8, 14
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 72
LDI r12, 497
LDI r13, 194
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
