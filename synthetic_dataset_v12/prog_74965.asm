; DESCRIPTION: Composite: Places a yellow line segment connecting (174, 116) to (192, 123) then Creates a white circular shape at (319, 116) with radius 74 then Places a yellow dot at position (314, 85).
; PLAN: r0=174(x1), r1=116(y1), r2=192(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=116(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x), r11=85(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 116
LDI r2, 192
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 116
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 85
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
