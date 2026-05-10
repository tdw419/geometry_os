; DESCRIPTION: Composite: Places a white dot at position (74, 142) then Creates a orange rectangular region at (52, 26) spanning 116 by 82 pixels then Creates a white circular shape at (305, 136) with radius 80.
; PLAN: r0=74(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=26(y), r7=116(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x), r11=136(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 74
LDI r1, 142
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 26
LDI r7, 116
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 136
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
