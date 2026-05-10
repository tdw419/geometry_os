; DESCRIPTION: Composite: Places a black circle of radius 29 at center (296, 57) then Creates a blue rectangular region at (216, 1) spanning 58 by 85 pixels then Sets a single white pixel at (319, 77).
; PLAN: r0=296(x), r1=57(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=1(y), r7=58(width), r8=85(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=77(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 57
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 1
LDI r7, 58
LDI r8, 85
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 77
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
