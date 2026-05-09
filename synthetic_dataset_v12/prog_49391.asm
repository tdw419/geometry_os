; DESCRIPTION: Composite: Places a white dot at position (310, 37) then Creates a cyan rectangular region at (77, 9) spanning 118 by 109 pixels then Creates a blue circular shape at (285, 108) with radius 38.
; PLAN: r0=310(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=9(y), r7=118(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=285(x), r11=108(y), r12=38(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 310
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 9
LDI r7, 118
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 108
LDI r12, 38
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
