; DESCRIPTION: Composite: Places a magenta line segment connecting (58, 81) to (306, 12) then Renders a blue box of size 21x116 starting at (376, 133) then Places a red dot at position (153, 175).
; PLAN: r0=58(x1), r1=81(y1), r2=306(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=133(y), r7=21(width), r8=116(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x), r11=175(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 81
LDI r2, 306
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 133
LDI r7, 21
LDI r8, 116
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 175
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
