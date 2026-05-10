; DESCRIPTION: Composite: Places a black dot at position (351, 96) then Renders a white box of size 58x35 starting at (171, 51) then Creates a blue circular shape at (399, 94) with radius 79.
; PLAN: r0=351(x), r1=96(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=51(y), r7=58(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=399(x), r11=94(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 96
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 171
LDI r6, 51
LDI r7, 58
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 94
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
