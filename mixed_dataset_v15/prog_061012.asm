; DESCRIPTION: Composite: Draws a green line from (360, 165) to (408, 43) then Draws a red rectangle at (341, 90) with width 90 and height 86 then Sets a single red pixel at (84, 155).
; PLAN: r0=360(x1), r1=165(y1), r2=408(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=90(y), r7=90(width), r8=86(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=84(x), r11=155(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 360
LDI r1, 165
LDI r2, 408
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 90
LDI r7, 90
LDI r8, 86
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 155
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
