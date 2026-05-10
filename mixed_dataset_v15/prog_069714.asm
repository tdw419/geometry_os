; DESCRIPTION: Composite: Places a red dot at position (355, 183) then Creates a purple rectangular region at (177, 139) spanning 109 by 64 pixels then Places a green line segment connecting (279, 29) to (81, 10).
; PLAN: r0=355(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=139(y), r7=109(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=279(x1), r11=29(y1), r12=81(x2), r13=10(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 177
LDI r6, 139
LDI r7, 109
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 29
LDI r12, 81
LDI r13, 10
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
