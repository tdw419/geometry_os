; DESCRIPTION: Composite: Draws a red circle centered at (364, 105) with radius 34 then Places a white line segment connecting (72, 121) to (147, 189) then Places a purple dot at position (291, 192).
; PLAN: r0=364(x), r1=105(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x1), r6=121(y1), r7=147(x2), r8=189(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=291(x), r11=192(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 105
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 121
LDI r7, 147
LDI r8, 189
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 192
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
