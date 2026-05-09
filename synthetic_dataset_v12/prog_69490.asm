; DESCRIPTION: Composite: Renders a white line between points (122, 246) and (51, 91) then Creates a white rectangular region at (31, 17) spanning 64 by 80 pixels then Places a magenta dot at position (256, 142).
; PLAN: r0=122(x1), r1=246(y1), r2=51(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=17(y), r7=64(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=142(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 246
LDI r2, 51
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 17
LDI r7, 64
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 142
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
