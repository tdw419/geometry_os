; DESCRIPTION: Composite: Places a white dot at position (22, 87) then Creates a white rectangular region at (426, 32) spanning 26 by 57 pixels then Creates a black circular shape at (149, 82) with radius 51.
; PLAN: r0=22(x), r1=87(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=32(y), r7=26(width), r8=57(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x), r11=82(y), r12=51(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 22
LDI r1, 87
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 32
LDI r7, 26
LDI r8, 57
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 82
LDI r12, 51
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
