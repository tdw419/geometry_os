; DESCRIPTION: Composite: Sets a single purple pixel at (211, 230) then Draws a green rectangle at (37, 60) with width 83 and height 106 then Draws a yellow line from (484, 239) to (254, 124).
; PLAN: r0=211(x), r1=230(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=37(x), r6=60(y), r7=83(width), r8=106(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x1), r11=239(y1), r12=254(x2), r13=124(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 230
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 37
LDI r6, 60
LDI r7, 83
LDI r8, 106
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 239
LDI r12, 254
LDI r13, 124
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
