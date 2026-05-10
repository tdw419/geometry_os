; DESCRIPTION: Composite: Sets a single cyan pixel at (37, 182) then Creates a blue circular shape at (118, 79) with radius 47 then Creates a black rectangular region at (26, 26) spanning 20 by 58 pixels.
; PLAN: r0=37(x), r1=182(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=79(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x), r11=26(y), r12=20(width), r13=58(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 37
LDI r1, 182
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 79
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 26
LDI r12, 20
LDI r13, 58
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
