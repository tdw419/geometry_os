; DESCRIPTION: Composite: Sets a single purple pixel at (59, 218) then Creates a purple rectangular region at (69, 103) spanning 109 by 49 pixels then Places a blue line segment connecting (258, 73) to (42, 113).
; PLAN: r0=59(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=69(x), r6=103(y), r7=109(width), r8=49(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x1), r11=73(y1), r12=42(x2), r13=113(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 218
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 69
LDI r6, 103
LDI r7, 109
LDI r8, 49
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 73
LDI r12, 42
LDI r13, 113
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
