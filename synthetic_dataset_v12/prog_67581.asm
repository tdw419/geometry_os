; DESCRIPTION: Composite: Sets a single red pixel at (461, 186) then Draws a purple line from (236, 218) to (328, 99) then Draws a cyan rectangle at (13, 6) with width 78 and height 15.
; PLAN: r0=461(x), r1=186(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=236(x1), r6=218(y1), r7=328(x2), r8=99(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=6(y), r12=78(width), r13=15(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 186
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 236
LDI r6, 218
LDI r7, 328
LDI r8, 99
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 6
LDI r12, 78
LDI r13, 15
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
