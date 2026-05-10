; DESCRIPTION: Composite: Draws a purple line from (48, 155) to (509, 105) then Draws a cyan rectangle at (137, 135) with width 22 and height 96 then Sets a single red pixel at (267, 144).
; PLAN: r0=48(x1), r1=155(y1), r2=509(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=135(y), r7=22(width), r8=96(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x), r11=144(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 48
LDI r1, 155
LDI r2, 509
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 135
LDI r7, 22
LDI r8, 96
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 144
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
