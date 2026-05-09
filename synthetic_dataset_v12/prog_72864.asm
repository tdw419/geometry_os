; DESCRIPTION: Composite: Sets a single purple pixel at (178, 217) then Draws a yellow line from (309, 234) to (335, 229) then Draws a cyan rectangle at (186, 140) with width 117 and height 49.
; PLAN: r0=178(x), r1=217(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=309(x1), r6=234(y1), r7=335(x2), r8=229(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=186(x), r11=140(y), r12=117(width), r13=49(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 217
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 234
LDI r7, 335
LDI r8, 229
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 140
LDI r12, 117
LDI r13, 49
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
