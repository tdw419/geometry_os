; DESCRIPTION: Composite: Creates a purple rectangular region at (95, 137) spanning 97 by 104 pixels then Places a white dot at position (475, 12) then Creates a purple circular shape at (440, 86) with radius 51.
; PLAN: r0=95(x), r1=137(y), r2=97(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=475(x), r6=12(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=440(x), r11=86(y), r12=51(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 95
LDI r1, 137
LDI r2, 97
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 12
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 440
LDI r11, 86
LDI r12, 51
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
