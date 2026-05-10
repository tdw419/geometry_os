; DESCRIPTION: Composite: Places a black dot at position (153, 177) then Places a red line segment connecting (249, 161) to (142, 181) then Creates a magenta rectangular region at (274, 65) spanning 88 by 35 pixels.
; PLAN: r0=153(x), r1=177(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=249(x1), r6=161(y1), r7=142(x2), r8=181(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=65(y), r12=88(width), r13=35(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 177
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 249
LDI r6, 161
LDI r7, 142
LDI r8, 181
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 65
LDI r12, 88
LDI r13, 35
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
