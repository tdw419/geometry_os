; DESCRIPTION: Composite: Sets a single cyan pixel at (484, 135) then Renders a green line between points (493, 99) and (347, 240) then Draws a cyan rectangle at (225, 169) with width 17 and height 11.
; PLAN: r0=484(x), r1=135(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=99(y1), r7=347(x2), r8=240(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=169(y), r12=17(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 135
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 493
LDI r6, 99
LDI r7, 347
LDI r8, 240
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 169
LDI r12, 17
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
