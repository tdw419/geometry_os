; DESCRIPTION: Composite: Sets a single red pixel at (0, 76) then Creates a purple rectangular region at (102, 38) spanning 118 by 22 pixels then Places a yellow circle of radius 42 at center (388, 126).
; PLAN: r0=0(x), r1=76(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=38(y), r7=118(width), r8=22(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x), r11=126(y), r12=42(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 76
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 102
LDI r6, 38
LDI r7, 118
LDI r8, 22
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 126
LDI r12, 42
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
