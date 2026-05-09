; DESCRIPTION: Composite: Draws a black circle centered at (338, 189) with radius 43 then Creates a white rectangular region at (310, 179) spanning 47 by 70 pixels then Places a purple dot at position (508, 180).
; PLAN: r0=338(x), r1=189(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=179(y), r7=47(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=508(x), r11=180(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 189
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 179
LDI r7, 47
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 180
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
