; DESCRIPTION: Composite: Creates a red rectangular region at (260, 122) spanning 71 by 87 pixels then Creates a black circular shape at (229, 124) with radius 59 then Places a red dot at position (436, 165).
; PLAN: r0=260(x), r1=122(y), r2=71(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=124(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=436(x), r11=165(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 260
LDI r1, 122
LDI r2, 71
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 124
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 436
LDI r11, 165
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
