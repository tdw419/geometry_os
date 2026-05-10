; DESCRIPTION: Composite: Draws a blue rectangle at (24, 136) with width 47 and height 97 then Renders a black line between points (451, 222) and (276, 138) then Sets a single black pixel at (310, 105).
; PLAN: r0=24(x), r1=136(y), r2=47(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x1), r6=222(y1), r7=276(x2), r8=138(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=105(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 24
LDI r1, 136
LDI r2, 47
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 222
LDI r7, 276
LDI r8, 138
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 105
LDI r12, 0x000000
PSET r10, r11, r12
HALT
