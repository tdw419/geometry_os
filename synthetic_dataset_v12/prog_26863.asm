; DESCRIPTION: Composite: Draws a purple circle centered at (428, 147) with radius 51 then Draws a red rectangle at (135, 139) with width 38 and height 13 then Sets a single orange pixel at (124, 18).
; PLAN: r0=428(x), r1=147(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=139(y), r7=38(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x), r11=18(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 428
LDI r1, 147
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 139
LDI r7, 38
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 18
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
