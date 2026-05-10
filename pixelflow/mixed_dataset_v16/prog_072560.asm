; DESCRIPTION: Composite: Creates a red rectangular region at (393, 110) spanning 29 by 113 pixels then Places a black dot at position (415, 95) then Draws a green circle centered at (351, 52) with radius 37.
; PLAN: r0=393(x), r1=110(y), r2=29(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=95(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=351(x), r11=52(y), r12=37(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 110
LDI r2, 29
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 95
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 351
LDI r11, 52
LDI r12, 37
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
