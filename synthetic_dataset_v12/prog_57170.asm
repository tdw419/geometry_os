; DESCRIPTION: Composite: Creates a green rectangular region at (352, 133) spanning 89 by 87 pixels then Creates a red circular shape at (227, 182) with radius 24 then Places a white dot at position (390, 244).
; PLAN: r0=352(x), r1=133(y), r2=89(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=182(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x), r11=244(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 133
LDI r2, 89
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 182
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 244
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
