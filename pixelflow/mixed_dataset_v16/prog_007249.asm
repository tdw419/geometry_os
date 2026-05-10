; DESCRIPTION: Composite: Creates a yellow circular shape at (118, 142) with radius 67 then Creates a purple rectangular region at (230, 66) spanning 19 by 101 pixels then Sets a single magenta pixel at (273, 174).
; PLAN: r0=118(x), r1=142(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x), r6=66(y), r7=19(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x), r11=174(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 118
LDI r1, 142
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 66
LDI r7, 19
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 174
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
