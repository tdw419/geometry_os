; DESCRIPTION: Composite: Draws a cyan rectangle at (229, 127) with width 20 and height 64 then Renders a purple line between points (492, 8) and (486, 0) then Sets a single black pixel at (379, 144).
; PLAN: r0=229(x), r1=127(y), r2=20(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x1), r6=8(y1), r7=486(x2), r8=0(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=144(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 127
LDI r2, 20
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 8
LDI r7, 486
LDI r8, 0
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 144
LDI r12, 0x000000
PSET r10, r11, r12
HALT
