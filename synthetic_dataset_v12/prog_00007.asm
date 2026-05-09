; DESCRIPTION: Composite: Draws a purple circle centered at (298, 128) with radius 67 then Draws a white rectangle at (178, 98) with width 81 and height 36 then Sets a single black pixel at (186, 55).
; PLAN: r0=298(x), r1=128(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=98(y), r7=81(width), r8=36(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=186(x), r11=55(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 128
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 98
LDI r7, 81
LDI r8, 36
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 55
LDI r12, 0x000000
PSET r10, r11, r12
HALT
