; DESCRIPTION: Composite: Creates a yellow rectangular region at (100, 90) spanning 92 by 96 pixels then Renders a magenta line between points (216, 67) and (407, 53) then Places a purple dot at position (308, 4).
; PLAN: r0=100(x), r1=90(y), r2=92(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x1), r6=67(y1), r7=407(x2), r8=53(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=4(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 90
LDI r2, 92
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 67
LDI r7, 407
LDI r8, 53
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 4
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
