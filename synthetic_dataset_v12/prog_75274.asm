; DESCRIPTION: Composite: Sets a single magenta pixel at (469, 179) then Creates a purple rectangular region at (288, 1) spanning 77 by 24 pixels then Creates a white circular shape at (249, 91) with radius 56.
; PLAN: r0=469(x), r1=179(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=1(y), r7=77(width), r8=24(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=249(x), r11=91(y), r12=56(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 469
LDI r1, 179
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 1
LDI r7, 77
LDI r8, 24
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 91
LDI r12, 56
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
