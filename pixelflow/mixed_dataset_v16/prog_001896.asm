; DESCRIPTION: Composite: Places a yellow 36x37 rectangle at position (147, 216) then Creates a white circular shape at (183, 81) with radius 43 then Places a purple dot at position (222, 41).
; PLAN: r0=147(x), r1=216(y), r2=36(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=81(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x), r11=41(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 147
LDI r1, 216
LDI r2, 36
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 81
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 41
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
