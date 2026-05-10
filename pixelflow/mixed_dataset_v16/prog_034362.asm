; DESCRIPTION: Composite: Creates a black rectangular region at (371, 141) spanning 89 by 10 pixels then Places a red line segment connecting (129, 72) to (421, 141) then Places a white dot at position (285, 114).
; PLAN: r0=371(x), r1=141(y), r2=89(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x1), r6=72(y1), r7=421(x2), r8=141(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=114(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 141
LDI r2, 89
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 72
LDI r7, 421
LDI r8, 141
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 114
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
