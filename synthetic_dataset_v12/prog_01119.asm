; DESCRIPTION: Composite: Places a black line segment connecting (325, 1) to (467, 42) then Draws a white circle centered at (217, 94) with radius 43 then Places a purple dot at position (325, 41).
; PLAN: r0=325(x1), r1=1(y1), r2=467(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=94(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=325(x), r11=41(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 1
LDI r2, 467
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 94
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 325
LDI r11, 41
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
